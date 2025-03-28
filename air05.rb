# frozen_string_literal: true

# Operate on all — AIR05
# Applies a numeric operation (+, -, *, /) to a list of integers.

OP_SYMBOLS = ['+', '-', '*', '/'].freeze

# Validation

def validate_arguments(arguments)
  return 'error: at least two arguments expected' if arguments.length < 2
  return 'error: empty input detected' if contains_empty_input?(arguments)

  operands = arguments[0..-2]
  operation = arguments[-1]

  return 'error: all arguments must be numeric' unless numeric_arguments?(operands)
  return 'error: invalid operation format' unless valid_operation_format?(operation)

  operator, operand_string = extract_operator_and_operand(operation)
  # rubocop:disable Style/NumericPredicate
  return 'error: division by zero' if operator == '/' && operand_string.to_i == 0
  # rubocop:enable Style/NumericPredicate

  nil
end

# Helpers

def contains_empty_input?(array)
  array.any? { |str| str.strip.empty? }
end

def numeric_string?(string)
  return false if string.empty?

  i = 0
  i += 1 if ['+', '-'].include?(string[0])
  return false if i >= string.length

  while i < string.length
    return false if string[i] < '0' || string[i] > '9'

    i += 1
  end
  true
end

def numeric_arguments?(array)
  array.all? { |string| numeric_string?(string) }
end

def valid_operation_format?(string)
  return false if string.length < 2

  operator = string[0]
  operand = string[1..]
  OP_SYMBOLS.include?(operator) && numeric_string?(operand)
end

def extract_operator_and_operand(string)
  [string[0], string[1..]]
end

# Business logic

# rubocop:disable Metrics/MethodLength
def apply_operation(numbers, operator, operand)
  result = []
  i = 0
  while i < numbers.length
    case operator
    when '+' then result << numbers[i] + operand
    when '-' then result << numbers[i] - operand
    when '*' then result << numbers[i] * operand
    when '/' then result << numbers[i] / operand
    end
    i += 1
  end
  result
end
# rubocop:enable Metrics/MethodLength

# Execution

def main
  arguments = ARGV
  error = validate_arguments(arguments)
  return puts error if error

  operator, operand_string = extract_operator_and_operand(arguments[-1])
  operand = operand_string.to_i
  numbers = arguments[0..-2].map(&:to_i)

  puts apply_operation(numbers, operator, operand).join(' ')
end

main if __FILE__ == $PROGRAM_NAME
