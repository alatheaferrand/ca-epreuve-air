# frozen_string_literal: true

# Read File — AIR10
# Displays the content of a file provided as argument.
# Example: ruby air10.rb file.txt

# Validation

def validate_arguments(arguments)
  return 'error: 1 file expected' unless arguments.length == 1

  file_path = arguments[0]
  return 'error: file not found' unless file_exists?(file_path)
  return 'error: file not accessible' unless file_accessible?(file_path)
  return 'error: file is empty' if file_empty?(file_path)

  nil
end

# File check helpers (homemade, no native File.*)

def file_exists?(file_path)
  files = Dir.entries(Dir.pwd)

  i = 0
  while i < files.length
    return true if files[i] == file_path

    i += 1
  end

  false
end

def file_accessible?(file_path)
  File.open(file_path, 'r') { true }
rescue Errno::EACCES
  false
end

def file_empty?(file_path)
  size = 0
  File.open(file_path, 'r') do |file|
    while (line = file.gets)
      size += line.bytesize
    end
  end
  size.zero?
end

# Business logic

def read_file(file_path)
  content = ''
  File.open(file_path, 'r') do |file|
    while (line = file.gets)
      content += line
    end
  end
  content
end

# Program execution

def main
  arguments = ARGV
  error = validate_arguments(arguments)
  return puts error if error

  puts read_file(arguments[0])
end

main if __FILE__ == $PROGRAM_NAME
