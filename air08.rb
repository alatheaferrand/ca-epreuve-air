# frozen_string_literal: true

# Fusion — AIR08
# Merges two sorted arrays of integers into one sorted array.
# Example: ruby air08.rb 1 2 3 fusion 4 5 6 → 1 2 3 4 5 6

# Validation

def validate_arguments(arguments)
  return 'error: at least 5 arguments expected' if arguments.length < 5
  return 'error: empty input detected' if contains_empty_input?(arguments)
  return 'error: fusion token expected' unless arguments.include?('fusion')
  return 'error: "fusion" at start/end' if fusion_misplaced?(arguments)
  return 'error: non-numeric value detected' unless all_numeric_except_fusion?(arguments)

  nil
end

def fusion_misplaced?(arguments)
  arguments.first == 'fusion' || arguments.last == 'fusion'
end

def all_numeric_except_fusion?(arguments)
  arguments.reject { |argument| argument == 'fusion' }.all? do |argument|
    numeric_string?(argument)
  end
end

# Business logic

def merged_sorted_arrays(array1, array2)
  result = []
  i = 0
  j = 0

  while i < array1.length && j < array2.length
    result << (array1[i] <= array2[j] ? array1[i] : array2[j])
    array1[i] <= array2[j] ? i += 1 : j += 1
  end

  append_remaining(result, array1, i)
  append_remaining(result, array2, j)

  result
end

def append_remaining(result, array, index)
  while index < array.length
    result << array[index]
    index += 1
  end
end

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

def sorted?(numbers)
  i = 1
  while i < numbers.length
    return false if numbers[i] < numbers[i - 1]

    i += 1
  end
  true
end

# Program execution

def main
  arguments = ARGV

  error = validate_arguments(arguments)
  return puts error if error

  index = arguments.index('fusion')

  raw_array1 = arguments[0...index]
  raw_array2 = arguments[(index + 1)..]

  array1 = raw_array1.map(&:to_i)
  array2 = raw_array2.map(&:to_i)

  return puts 'error: arrays must be sorted' unless sorted?(array1) && sorted?(array2)

  puts merged_sorted_arrays(array1, array2).join(' ')
end

main if __FILE__ == $PROGRAM_NAME
