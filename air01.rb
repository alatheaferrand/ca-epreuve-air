# frozen_string_literal: true

# Split — AIR01
# Receives a string and a separator, and returns an array split on that separator.
# Example usage: ruby air01.rb "hello>world>!" ">"

# Validation

def validate_arguments(arguments)
  return 'error: two strings expected' unless arguments.length == 2
  return 'error: empty input detected' if contains_empty_input?(arguments)

  nil
end

# Business logic

# rubocop:disable Metrics/MethodLength
def split(string, separator)
  segments = []
  current = ''
  i = 0

  while i <= string.length - separator.length
    if match_separator?(string, separator, i)
      segments << current
      current = ''
      i += separator.length
    else
      current += string[i]
      i += 1
    end
  end

  current += string[i..] if i < string.length
  segments << current

  segments
end
# rubocop:enable Metrics/MethodLength

def match_separator?(string, separator, index)
  string[index, separator.length] == separator
end

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
  separator = arguments[1]

  strings = split(string, separator)
  return puts string if strings.length == 1

  puts strings
end

main if __FILE__ == $PROGRAM_NAME
