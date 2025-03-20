# frozen_string_literal: true

# Insertion dans un tableau trié
# Programme qui ajoute à une liste d'entiers triée un nouvel entier
# tout en gardant la liste triée dans l'ordre croissant.
# Le dernier argument est l'élément à ajouter.
# Utiliser une fonction du genre:
#  sorted_insert(array, new_element) {
#    your algo
#    return (new_array)
#  }
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def sorted_insert(array, new_element)
  new_array = []
  inserted = false

  array.each do |element|
    new_array << new_element if !inserted && element.to_i > new_element.to_i
    inserted = true if !inserted && element.to_i > new_element.to_i
    new_array << element
  end

  new_array << new_element unless inserted
  new_array.join(' ')
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: at least two arguments expected' unless at_least_two_argument?(arguments)
  return 'error: all arguments must be numeric' unless arguments.all? { |argument| numeric?(argument) }
end

def at_least_two_argument?(arguments)
  arguments.size >= 2
end

def numeric?(number)
  !Integer(number, exception: false).nil?
end
  
# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def new_array_sorted_insert()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  array = arguments[0..-2]
  new_element = arguments[-1]

  return sorted_insert(array, new_element)
end

# ---------- Execution ----------

puts new_array_sorted_insert()
