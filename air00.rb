# Split
# Découpe une chaîne de caractères en tableau (séparateurs: espaces, tabulations, newlines)
# Le programme devra utiliser une fonction prototypée comme ceci:
# ma_fonction(string_à_couper, string_séparateur) {
#  algorithme
#  return (tableau)
# }
# Afficher error et quitter le programme en cas de problèmes d'arguments

# Fonction
def decoupe(string_a_couper, string_separateur)
  tableau = []
  string_decoupe = ''

  for i in (0...string_a_couper.length)
    est_separateur = false # Flag de séparation
    for j in (0...string_separateur.length)
      if string_a_couper[i] == string_separateur[j]
        est_separateur = true
        break
      end
    end
    
    if est_separateur # true
      if string_decoupe != ''
        tableau << string_decoupe
        string_decoupe = ''
      end
    else # flag false
      string_decoupe << string_a_couper[i]
    end
  end

  if string_decoupe != '' # Ajoute le dernier mot
    tableau << string_decoupe
  end

  return tableau
end

# Gestion d'erreurs
if ARGV.length != 1 || ARGV[0].nil? || ARGV[0].empty?
  puts 'error'
  exit
end

# Parsing
string_a_couper = ARGV[0]
string_separateur = [' ', "\t", "\n"]

# Exécution
tableau = decoupe(string_a_couper, string_separateur)

# Affichage
puts tableau
