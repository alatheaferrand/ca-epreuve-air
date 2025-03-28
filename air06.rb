# frozen_string_literal: true

# Pass Sanitary Filter — AIR06
# Filters a list of strings and returns those that contain the given substring (case-insensitive).
# Example: ruby air06.rb Michel Albert Therese Benoit t → Michel, Albert

# Validation

def validate_arguments(arguments)
  return 'error: at least three arguments expected' if arguments.length < 3
  return 'error: empty input detected' if contains_empty_input?(arguments)

  nil
end

# Business logic

# rubocop:disable Metrics/MethodLength
def filter_strings(strings, substring)
  filtered = []
  i = 0
  while i < strings.length
    string = strings[i]
    j = 0
    found = false

    while j <= string.length - substring.length
      if string[j, substring.length].downcase == substring.downcase
        found = true
        break
      end
      j += 1
    end

    filtered << string if found
    i += 1
  end
  filtered
end
# rubocop:enable Metrics/MethodLength

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

# Program execution

def main
  arguments = ARGV

  error = validate_arguments(arguments)
  if error
    puts error
    return
  end

  strings = arguments[0..-2]
  substring = arguments[-1]

  result = filter_strings(strings, substring)

  puts result.join(', ')
end

main if __FILE__ == $PROGRAM_NAME
