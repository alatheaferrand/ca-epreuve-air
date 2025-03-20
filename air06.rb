# frozen_string_literal: true

# Contrôle de pass sanitaire
# Programme qui supprime d'un tableau tous les éléments qui ne contiennent pas
# une autre chaîne de caractères.
# Utiliser une fonction de ce genre:
#  ma_fonction(array_de_strings, string) {
#    mon algorithme
#    return (nouvel_array_de_strings)
#  }
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def filter_strings(array, token)
  array_of_elements_to_delete = []
  token = token.downcase

  array.each do |string|
    check_string = string.downcase
    is_token_match = false

    (0..(check_string.length - token.length)).each do |i|
      if check_string[i, token.length] == token
        is_token_match = true
        break
      end
    end

    array_of_elements_to_delete << string unless is_token_match
  end

  array_of_elements_to_delete.join(', ')
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: at least two arguments expected' unless at_least_two_argument?(arguments)
  return 'error: empty input detected' if arguments.any? { |argument| empty_input?(argument) }
end

def at_least_two_argument?(arguments)
  arguments.size >= 2
end

def empty_input?(string)
  string.strip.empty?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def filtered_strings()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  string = arguments[-1]
  array = arguments[0..-2]

  filter_strings(array, string)
end

# ---------- Execution ----------

puts filtered_strings()
