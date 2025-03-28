# frozen_string_literal: true

# Unique once — AIR04
# Prints the input string with adjacent duplicate characters removed.
# Example: ruby air04.rb "Hello  milady !!" → "Helo milady !"

# Validation

def validate_arguments(arguments)
  return 'error: one string expected' if arguments.length != 1
  return 'error: empty input detected' if empty_input?(arguments[0])

  nil
end

# Business logic

def remove_adjacent_duplicates(string)
  result = +''
  i = 0
  while i < string.length
    result << string[i] unless result[-1] == string[i]

    i += 1
  end
  result
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

# Program execution

def main
  arguments = ARGV
  error = validate_arguments(arguments)
  return puts error if error

  puts remove_adjacent_duplicates(arguments[0])
end

main if __FILE__ == $PROGRAM_NAME
