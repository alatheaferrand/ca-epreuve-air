# frozen_string_literal: true

# Afficher une pyramide
# Afficher un escalier constitué d'un caractère et d'un nombre d'étages 
# donné en paramètre.
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def display_pyramid(char, height)
    pyramid = []
  
    i = 0
    while i < height
      line = ''
      spaces = height - i - 1
      chars = (2 * i) + 1
  
      j = 0
      while j < spaces
        line += ' '
        j += 1
      end
  
      k = 0
      while k < chars
        line += char
        k += 1
      end
  
      pyramid << line
      i += 1
    end
  
    pyramid.join("\n")
  end

# ---------- Error Handling ----------  

def validate_arguments(arguments)
  return 'error: 2 arguments expected' unless two_arguments?(arguments)
  return 'error: empty input detected' if arguments.any? { |argument| empty_input?(argument) }

  char = arguments[0]
  height = arguments[1]

  return 'error: 1 character expected' unless one_char?(char)
  return 'error: 1 integer expected' unless numeric?(height)
  return 'error: height must be greater than zero'unless height.to_i > 0
end

def two_arguments?(arguments)
  arguments.length == 2
end

def empty_input?(string)
  i = 0
  while i < string.length
    return false if string[i] != " "
    i += 1
  end
  true
end

def one_char?(char)
  char.length == 1
end

def numeric?(value)
  !Integer(value, exception: false).nil?
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def trace_pyramid()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  char, height = arguments[0], arguments[1].to_i
  display_pyramid(char, height)
end

# ---------- Execution ----------

puts trace_pyramid()
