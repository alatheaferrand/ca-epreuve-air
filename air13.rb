# frozen_string_literal: true

# ---------- META EXERCICE ----------

require 'json'
require 'yaml'

# ---------- CONSTANTS ----------

GREEN = "\e[32m"
RED = "\e[31m"
BLUE = "\e[34m"
RESET = "\e[0m"

CURRENT_SCRIPT = File.basename(__FILE__)
PATTERN = ENV.fetch('PATTERN', '*.rb')
TEST_FILE = ENV.fetch('TEST_FILE', 'air13_tests.json')

# ---------- FILE HANDLING ----------

def find_scripts()
  files = Dir.glob(PATTERN) - [CURRENT_SCRIPT]
  return files unless files.empty?

  puts "#{RED}Error: No scripts found in the directory#{RESET}"
  []
end

def read_file(path)
  return File.read(path) if File.exist?(path)

  puts "#{RED}Error: The file '#{path}' was not found#{RESET}"
  nil
end

def load_tests(file)
  content = read_file(file)
  return {} if content.nil?

  case File.extname(file)
  when '.json' then JSON.parse(content)
  when '.yaml', '.yml' then YAML.safe_load(content, permitted_classes: [String, Array, Hash])
  else
    puts "#{RED}Error: Unsupported file format (#{file})#{RESET}"
    return {}
  end
rescue JSON::ParserError, Psych::SyntaxError
  puts "#{RED}Error: Invalid test file format (#{file})#{RESET}"
  return {}
end

# ---------- SCRIPT EXECUTION ----------

def run_script(file, arguments)
  output = `ruby #{file} #{arguments.map { |argument| "\"#{argument}\"" }.join(' ')}`.chomp
  output.include?("\n") ? output.split("\n") : output
end

def check_output(file, index, total, output, expected)
  success = output == expected
  status = success ? "#{GREEN}success#{RESET}" : "#{RED}failure#{RESET}"

  puts "#{file} (#{index}/#{total}) : #{status}"
  unless success
    puts "   ↳ Output : #{output.inspect}"
    puts "   ↳ Expected : #{expected.inspect}"
  end

  success
end

# ---------- MAIN EXECUTION ----------

def run_tests()
  tests = load_tests(TEST_FILE)
  return puts "#{RED}Error: No test cases found in '#{TEST_FILE}'#{RESET}" if tests.empty?

  total_tests = 0
  total_success = 0

  find_scripts().each do |script|
    unless tests.key?(script)
      puts "#{RED}Warning: No tests found for script '#{script}'#{RESET}"
      next
    end

    cases = tests[script]
    total_tests += cases.size

    cases.each_with_index do |test, i|
      output = run_script(script, test['arguments'])
      total_success += 1 if check_output(script, i + 1, cases.size, output, test['expected'])
    end
  end

  puts "\n#{BLUE}Total success: #{total_success}/#{total_tests}#{RESET}"
end

# ---------- EXECUTION ----------

run_tests()
