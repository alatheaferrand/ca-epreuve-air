# frozen_string_literal: true

# Sur chacun d'entre eux
# Programme qui est capable de reconnaître et de faire
# une opération (addition ou soustraction) sur chaque entier d'une liste.
# L'opération à appliquer sera toujours le dernier élément
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def add_or_subtract(array)
  operands_list = array[0..-2]
  last_operand = array[-1].to_i
  result = []

  operands_list.each do |operand|
    result << operand.to_i + last_operand
  end

  result
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: at least two arguments expected' unless at_least_two_argument?(arguments)
  return 'error: all arguments must be numeric' unless arguments.all? { |argument| numeric?(argument) }
end

def at_least_two_argument?(arguments)
  arguments.size >= 2
end

def numeric?(value)
  !Integer(value, exception: false).nil?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def process_arguments()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  return add_or_subtract(arguments).join(' ')
end

# ---------- Execution ----------

puts process_arguments()
