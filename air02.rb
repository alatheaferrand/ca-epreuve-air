# frozen_string_literal: true

# Concat — AIR02
# Receives a list of strings and a separator, and returns the joined result.
# Example usage: ruby air02.rb Hello World ", "

# Validation

def validate_arguments(arguments)
  return 'error: at least three arguments expected' if arguments.length < 3

  strings = arguments[0...-1]
  return 'error: empty input detected' if contains_empty_input?(strings)

  nil
end

# Business logic

def concat(strings, separator)
  result = ''
  i = 0
  while i < strings.length
    result += strings[i]
    result += separator if i < strings.length - 1
    i += 1
  end
  result
end

# Helpers

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

# Main

def main
  arguments = ARGV
  error = validate_arguments(arguments)
  return puts error if error

  strings = arguments[0..-2]
  separator = arguments[-1]

  puts concat(strings, separator)
end

main if __FILE__ == $PROGRAM_NAME
