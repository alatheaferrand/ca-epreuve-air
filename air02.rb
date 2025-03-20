# frozen_string_literal: true

# Concat
# Programme qui transforme un tableau de chaînes de caractères
# en une seule chaîne de caractères. Espacés d'un séparateur donné en dernier argument.
# ma_fonction(array_de_string, séparateur) {
#  votre algorithme
#  return (string)
# }
# Affiche error et quitte le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def custom_concat(source_strings, concat_token)
  concat_string = +''

  i = 0
  while i < source_strings.length
    concat_string << source_strings[i]

    concat_string << concat_token if i < source_strings.length - 1

    i += 1
  end

  concat_string
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
  i = 0
  while i < string.length
    return false if string[i] != ""
    i += 1
  end
  true
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def concat_string()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  source_strings = arguments[0..-2]
  concat_token = arguments[-1]

  custom_concat(source_strings, concat_token)
end

# ---------- Execution ----------

puts concat_string()
