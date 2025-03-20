# frozen_string_literal: true

# Split
# Programme qui découpe une chaine de caractères en tableau (séparateurs : espaces, tabulations, retours à la ligne).
# Le programme devra utiliser une fonction prototypée comme ceci :
# ma_fonction(string_à_couper, string_séparateur) {
#  votre algorithme
#  return (tableau)
# }
# Affiche error et quitte le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def my_split(string_to_split, separators)
  array = []
  word = +''

  string_to_split.each_char do |char|
    is_separator = false

    separators.each do |separator|
      if char == separator
        is_separator = true
        break
      end
    end

    if is_separator == true
      array << word unless word.length == 0
      word = +''
    else
      word << char
    end
  end

  array << word unless word.length == 0

  array
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: one string expected' unless single_argument?(arguments)
  return 'error: empty input detected' if empty_input?(arguments[0])
end

def single_argument?(arguments)
  arguments.size == 1
end

def empty_input?(argument)
  argument.strip.empty?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments
  arguments = ARGV
end

# ---------- Problem Solving ----------

def split_string_into_array()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  string_to_split = arguments[0]
  separators = [' ', '\t', '\n']

  return my_split(string_to_split, separators)
end

# ---------- Execution ----------

puts split_string_into_array()
