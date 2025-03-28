# frozen_string_literal: true

# Rotation — AIR09
# Shifts all elements of an array to the left (first becomes last).
# Example: ruby air09.rb one two three → two three one

# Validation

def validate_arguments(arguments)
  return 'error: at least 2 arguments expected' if arguments.length < 2
  return 'error: empty input detected' if contains_empty_input?(arguments)

  nil
end

# Business logic

def rotate_left(array)
  rotated = []
  i = 1
  while i < array.length
    rotated << array[i]
    i += 1
  end

  rotated << array[0]
  rotated
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

# Program execution

def main
  arguments = ARGV

  error = validate_arguments(arguments)
  return puts error if error

  result = rotate_left(arguments)
  return puts 'error: empty input detected' if contains_empty_input?(result)

  puts result.join(', ')
end

main if __FILE__ == $PROGRAM_NAME
