# frozen_string_literal: true

# Le roi des tris
# Programme qui trie une liste de nombres.
# Doit implémenter l'algorithme du tri rapide (QuickSort).
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def quick_sort(array)
  return array if array.length <= 1

  pivot = array[-1].to_i
  left = []
  right = []

  i = 0
  while i < array.length - 1

    if array[i].to_i <= pivot
      left << array[i].to_i
    end

    if array[i].to_i > pivot
      right << array[i].to_i
    end

    i += 1
  end

  quick_sort(left) + [pivot] + quick_sort(right)
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: at least 2 arguments expected' unless at_least_two_argument?(arguments)
  return 'error: all arguments must be numeric' unless arguments.all? { |value| is_numeric?(value) }
  return 'error: all arguments are identical' if all_elements_identical?(arguments)
end

def at_least_two_argument?(arguments)
  arguments.size >= 2
end

def is_numeric?(value)
  !Integer(value, exception: false).nil?
end

def all_elements_identical?(array)
  i = 1
  while i < array.length
    return false if array[i] != array[0]
    i += 1
  end
  true
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def divide_and_conquer_sort()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  quick_sort(arguments).join(' ')
end

# ---------- Execution ----------

puts divide_and_conquer_sort()
