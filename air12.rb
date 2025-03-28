# frozen_string_literal: true

# Quick Sort — AIR12
# Sorts a list of integers using the QuickSort algorithm.
# Example: ruby air12.rb 5 1 4 2 3 → 1 2 3 4 5

# Validation

def validate_arguments(arguments)
  return 'error: at least 2 arguments expected' if arguments.length < 2
  return 'error: empty input detected' if contains_empty_input?(arguments)
  return 'error: all arguments must be numeric' unless numeric_arguments?(arguments)
  return 'error: all arguments are identical' if all_identical?(arguments)

  nil
end

def all_identical?(array)
  i = 1
  while i < array.length
    return false if array[i] != array[0]

    i += 1
  end
  true
end

# Business logic

# rubocop:disable Metrics/MethodLength
def quick_sort(numbers)
  return numbers if numbers.length <= 1

  pivot = numbers[-1]
  left = []
  right = []

  i = 0
  while i < numbers.length - 1
    if numbers[i] <= pivot
      left << numbers[i]
    else
      right << numbers[i]
    end

    i += 1
  end

  quick_sort(left) + [pivot] + quick_sort(right)
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

def numeric_arguments?(array)
  i = 0
  while i < array.length
    return false unless numeric_string?(array[i])

    i += 1
  end

  true
end

# Program execution

def main
  arguments = ARGV

  error = validate_arguments(arguments)
  return puts error if error

  numbers = []
  i = 0
  while i < arguments.length
    numbers << arguments[i].to_i
    i += 1
  end

  puts quick_sort(numbers).join(' ')
end

main if __FILE__ == $PROGRAM_NAME
