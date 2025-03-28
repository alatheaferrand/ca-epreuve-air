# frozen_string_literal: true

# Sorted Insert — AIR07
# Inserts a number into a sorted list while keeping it sorted in ascending order.
# Example: ruby air07.rb 1 3 4 2 → 1 2 3 4

# Validation

def validate_arguments(arguments)
  return 'error: at least two arguments expected' if arguments.length < 2
  return 'error: empty input detected' if contains_empty_input?(arguments)
  return 'error: all arguments must be numeric' unless numeric_arguments?(arguments)
  return 'error: input array is not sorted' unless sorted?(arguments[0..-2].map(&:to_i))

  nil
end

# Business logic

# rubocop:disable Metrics/MethodLength
def sorted_insert(numbers, value)
  result = []
  inserted = false

  i = 0
  while i < numbers.length
    current = numbers[i]

    if !inserted && value < current
      result << value
      inserted = true
    end

    result << current
    i += 1
  end

  result << value unless inserted
  result
end
# rubocop:enable Metrics/MethodLength

# Helpers

def empty_input?(string)
  i = 0
  while i < string.length
    return false if string[i] != ' '

    i += 1
  end
  true
end

def contains_empty_input?(array)
  i = 0
  while i < array.length
    return true if empty_input?(array[i])

    i += 1
  end

  false
end

def numeric_arguments?(array)
  i = 0
  while i < array.length
    return false unless numeric_string?(array[i])

    i += 1
  end

  true
end

def numeric_string?(string)
  return false if string.empty?

  i = 0
  i += 1 if ['+', '-'].include?(string[0])
  return false if i >= string.length

  while i < string.length
    char = string[i]
    return false if char < '0' || char > '9'

    i += 1
  end

  true
end

def sorted?(numbers)
  i = 1
  while i < numbers.length
    return false if numbers[i] < numbers[i - 1]

    i += 1
  end
  true
end

# Program execution

# rubocop:disable Metrics/MethodLength
def main
  arguments = ARGV

  error = validate_arguments(arguments)
  if error
    puts error
    return
  end

  values = arguments.map(&:to_i)
  array = values[0..-2]
  new_value = values[-1]

  result = sorted_insert(array, new_value)
  puts result.join(' ')
end
# rubocop:enable Metrics/MethodLength

main if __FILE__ == $PROGRAM_NAME
