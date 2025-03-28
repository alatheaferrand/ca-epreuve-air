# frozen_string_literal: true

# Split — AIR00
# Receives a string and returns an array of strings split by space, tab, or newline.
# Example usage: ruby air00.rb "This\tis a\ntest"

# Validation

def validate_arguments(arguments)
  return 'error: one string expected' unless arguments.length == 1
  return 'error: empty input detected' if contains_empty_input?(arguments)

  nil
end

# Business logic

# rubocop:disable Metrics/MethodLength
def split(string, separators)
  strings = []
  current = ''
  i = 0

  while i < string.length
    char = string[i]

    if includes?(char, separators)
      strings << current unless empty_input?(current)
      current = ''
    else
      current += char
    end

    i += 1
  end

  strings << current unless empty_input?(current)
  strings
end
# rubocop:enable Metrics/MethodLength

# Helpers

def includes?(char, array)
  i = 0
  while i < array.length
    return true if char == array[i]

    i += 1
  end
  false
end

def contains_empty_input?(array)
  i = 0
  while i < array.length
    return true if empty_input?(array[i])

    i += 1
  end
  false
end

def empty_input?(string)
  i = 0
  while i < string.length
    return false if string[i] != ' '

    i += 1
  end
  true
end

# Program execution

def main
  arguments = ARGV
  error = validate_arguments(arguments)
  return puts error if error

  string = arguments[0]
  separators = [' ', "\t", "\n"]

  strings = split(string, separators)
  return puts 'error: empty input detected' if strings.empty?

  puts strings
end

main if __FILE__ == $PROGRAM_NAME
