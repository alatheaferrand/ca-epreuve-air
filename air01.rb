# frozen_string_literal: true

# Split en fonction
# Programme qui découpe une chaine de caractères en tableau en fonction du séparateur donné en 2e argument.
# Le programme devra utiliser une fonction prototypée comme ceci :
# ma_fonction(string_à_couper, string_séparateur) {
#  votre algorithme
#  return (tableau)
# }
# Affiche error et quitte le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def custom_split(source_string, split_token)
  split_parts = []
  current_chunk = +''

  i = 0
  while i < source_string.length

    if source_string[i, split_token.length] == split_token
      split_parts << current_chunk unless current_chunk.empty?
      current_chunk = +''
      i += split_token.length
      next
    end

    current_chunk << source_string[i]
    i += 1
  end

  split_parts << current_chunk unless current_chunk.empty?

  split_parts
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: two strings expected' unless two_arguments?(arguments)
  return 'error: empty input detected' if arguments.any? { |argument| empty_input?(argument) }
end

def two_arguments?(arguments)
  arguments.size == 2
end

def empty_input?(argument)
  argument.strip.empty?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def split_string()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  source_string = arguments[0]
  split_token = arguments[1]

  return custom_split(source_string, split_token)
end

# ---------- Execution ----------

puts split_string()
