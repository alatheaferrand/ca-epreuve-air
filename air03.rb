# frozen_string_literal: true

# Chercher l'intrus
# Programme qui retourne la valeur d'une liste qui n'a pas de paire.
# Afficher error et quitter le programme en cas de problèmes d'arguments.

# ---------- Utility Functions ----------

def find_intruder(arguments)
  intruders = []

  i = 0
  while i < arguments.length
    has_a_pair = false
    j = 0
    while j < arguments.length
      if arguments[i] == arguments[j] && i != j
        has_a_pair = true
        break
      end
      j += 1
    end

    intruders << arguments[i] unless has_a_pair

    i +=1
  end

  return 'no intruder found' if intruders.empty?

  intruders.join(' ')
end
  
# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: at least two arguments expected' unless at_least_two_argument?(arguments)
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

def trace_intruder()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  return find_intruder(arguments)
end

# ---------- Execution ----------

puts trace_intruder()
