# frozen_string_literal: true

# Pyramid — AIR11
# Displays a pyramid of a given height using a single character.
# Example: ruby air11.rb O 3 → prints 3 levels of pyramid with 'O'

# Validation

def validate_arguments(arguments)
  return 'error: 2 arguments expected' unless arguments.length == 2
  return 'error: empty input detected' if contains_empty_input?(arguments)

  char = arguments[0]
  height = arguments[1]
  return 'error: 1 character expected' unless char.length == 1
  return 'error: 1 integer expected' unless numeric_string?(height)
  # rubocop:disable Style/NumericPredicate
  return 'error: height must be greater than zero' unless height.to_i > 0
  # rubocop:enable Style/NumericPredicate

  nil
end

# Business logic

def pyramid(char, height)
  i = 0
  while i < height
    spaces = ' ' * (height - i - 1)
    symbols = char * (2 * i + 1)
    puts spaces + symbols
    i += 1
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

# Program execution

def main
  arguments = ARGV

  error = validate_arguments(arguments)
  return puts error if error

  char = arguments[0]
  height = arguments[1].to_i

  pyramid(char, height)
end

main if __FILE__ == $PROGRAM_NAME
