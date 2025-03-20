# frozen_string_literal: true

# Mélanger deux tableaux triés
# Programme qui fusionne deux listes d'entiers triées en les gardant triées,
# les deux listes seront séparées par un "fusion".
# Utiliser une fonction du genre:
#  sorted_fusion(array1, array2) {
#    your algo
#    return (new_array)
#  }
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def sorted_fusion(first_array, second_array)
  array_fusion = first_array + second_array
  sorted = false

  until sorted
    sorted = true
    (array_fusion.length - 1).times do |i|
      next unless array_fusion[i] > array_fusion[i + 1]

      array_fusion[i], array_fusion[i + 1] = array_fusion[i + 1], array_fusion[i]
      sorted = false
    end
  end

  array_fusion.join(' ')
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: empty input detected' if arguments.any? { |argument| empty_input?(argument) }
  return 'error: at least 3 arguments expected' unless at_least_three_argument?(arguments)
  return 'error: "fusion" token expected between the two arrays' unless token_match?(arguments)
  return 'error: "fusion" must not be at the beginning or end' if fusion_misplaced?(arguments)
  return 'error: all arguments must be numeric except "fusion"' unless arguments.all? do |argument|
    numeric?(argument) || argument == 'fusion'
  end
end

def at_least_three_argument?(arguments)
  arguments.size >= 3
end

def token_match?(arguments)
  arguments.each { |argument| return true if argument == 'fusion' }
  false
end

def fusion_misplaced?(arguments)
  arguments.first == 'fusion' || arguments.last == 'fusion'
end

def numeric?(number)
  !Integer(number, exception: false).nil?
end

def empty_input?(string)
  i = 0
  while i < string.length
    return false if string[i] != " "
    i += 1
  end
  true
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def new_array_sorted_fusion()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  first_array = arguments[0...arguments.index('fusion')]
  second_array = arguments[arguments.index('fusion') + 1..]

  return sorted_fusion(first_array, second_array)
end

# ---------- Execution ----------

puts new_array_sorted_fusion()
