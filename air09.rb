# frozen_string_literal: true

# Rotation vers la gauche
# Programme qui décale tous les éléments d'un tableau vers la gauche.
# Le premier élément devient le dernier à chaque rotation.
# Utiliser une fonction du genre:
#  ma_rotation(array) {
#    your algo
#    return (new_array)
#  }
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def left_rotation(array)
  new_array = []
  new_array << array[1..] << array[0]

  new_array.join(', ')
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: at least 2 arguments expected' unless at_least_two_argument?(arguments)
  return 'error: empty input detected' if arguments.any? { |argument| empty_input?(argument) }
end

def at_least_two_argument?(arguments)
  arguments.size >= 2
end

def empty_input?(argument)
  argument.strip.empty?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def rotate_arguments()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  return left_rotation(arguments)
end

# ---------- Execution ----------

puts rotate_arguments()
