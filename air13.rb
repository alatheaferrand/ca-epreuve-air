# frozen_string_literal: true

# Test Runner — AIR13
# Runs predefined test cases for each script in the AIR series.

require 'json'
require 'shellwords' # ✅ Sécurise les arguments shell

# Constants

GREEN = "\e[32m"
RED = "\e[31m"
BLUE = "\e[34m"
RESET = "\e[0m"

CURRENT_SCRIPT = File.basename(__FILE__)
PATTERN = ENV.fetch('PATTERN', '*.rb')
TEST_FILE = 'air13_tests.json'

# Validation

def valid_script_name?(name)
  /^[a-zA-Z0-9_-]+\.rb$/.match?(name)
end

# File handling

def find_scripts
  Dir.glob(PATTERN).select { |f| f != CURRENT_SCRIPT && valid_script_name?(f) }
end

def read_file(path)
  return File.read(path) if File.exist?(path)

  puts "#{RED}Error: The file '#{path}' was not found#{RESET}"
  nil
end

def load_tests(file)
  content = read_file(file)
  return {} if content.nil?

  JSON.parse(content)
rescue JSON::ParserError
  puts "#{RED}Error: Invalid JSON test file (#{file})#{RESET}"
  {}
end

# Script execution

def run_script(file, arguments)
  args = arguments.map { |arg| Shellwords.escape(arg) }.join(' ')
  output = `ruby #{Shellwords.escape(file)} #{args}`.chomp
  output.include?("\n") ? output.split("\n") : output
end

def check_output(file, index, total, output, expected)
  success = output == expected
  status = success ? "#{GREEN}success#{RESET}" : "#{RED}failure#{RESET}"

  puts "#{file} (#{index}/#{total}) : #{status}"
  unless success
    puts "   ↳ Output   : #{output.inspect}"
    puts "   ↳ Expected : #{expected.inspect}"
  end

  success
end

def test_script(script, cases)
  success_count = 0

  cases.each_with_index do |test, i|
    output = run_script(script, test['arguments'])
    success_count += 1 if check_output(script, i + 1, cases.size, output, test['expected'])
  end

  success_count
end

# Program execution

# rubocop:disable Metrics/MethodLength
def run_tests
  tests = load_tests(TEST_FILE)
  return puts "#{RED}Error: No test cases found in '#{TEST_FILE}'#{RESET}" if tests.empty?

  total_tests = 0
  total_success = 0

  find_scripts.each do |script|
    unless tests.key?(script)
      puts "#{RED}Warning: No tests found for script '#{script}'#{RESET}"
      next
    end

    cases = tests[script]
    total_tests += cases.size
    total_success += test_script(script, cases)
  end

  puts "\n#{BLUE}Total success: #{total_success}/#{total_tests}#{RESET}"
end
# rubocop:enable Metrics/MethodLength

run_tests if __FILE__ == $PROGRAM_NAME
