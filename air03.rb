# frozen_string_literal: true

# Intruder — AIR03
# Prints all unique values (those that have no pair) from the input list.
# Example: ruby air03.rb a b c a b → c

# Validation

def validate_arguments(arguments)
  return 'error: at least two arguments expected' if arguments.length < 2
  return 'error: empty input detected' if contains_empty_input?(arguments)

  nil
end

# Business logic

# rubocop:disable Metrics/MethodLength
def find_intruders(strings)
  intruders = []
  i = 0
  while i < strings.length
    count = 0
    j = 0
    while j < strings.length
      count += 1 if strings[i] == strings[j]
      j += 1
    end
    intruders << strings[i] if count == 1
    i += 1
  end
  intruders
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

  strings = arguments # conversion explicite (pas de transformation ici)

  result = find_intruders(strings)
  puts result.join(' ') unless result.empty?
end

main if __FILE__ == $PROGRAM_NAME
