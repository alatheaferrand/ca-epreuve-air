# frozen_string_literal: true

# Un seul à la fois
# Programme qui affiche une chaïne de caractères en évitant les caractères identiques adjacents.
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def remove_adjacent_duplicates(string)
  new_string = +''
  i = 0
  while i < string.length
    new_string << string[i] unless new_string[-1] == string[i]
    i += 1
  end

  new_string
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: one string expected' unless single_argument?(arguments)
  return 'error: empty input detected' if empty_input?(arguments[0])
end

def single_argument?(arguments)
  arguments.size == 1
end

def empty_input?(string)
  string.strip.empty?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end
  
# ---------- Problem Solving ----------

def removed_adjacent_duplicates()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  string = arguments[0]
  return remove_adjacent_duplicates(string)
end

# ---------- Execution ----------

puts removed_adjacent_duplicates()

