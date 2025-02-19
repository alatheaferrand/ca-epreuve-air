# Split : Découpe une chaîne de caractères en tableau
# en utilisant des séparateurs : espaces, tabulations, newlines
# Le programme devra utiliser une fonction prototypée comme ceci:
# ma_fonction(string_à_couper, string_séparateur) {
#  algorithme
#  return (tableau)
# }
# Afficher error et quitter le programme en cas de problèmes d'arguments

# Fonction de découpe
def decoupe(string_a_couper, string_separateur)
  tableau = []
  string_decoupe = ''

  # Parcourt chaque caractère de la chaîne
  for i in (0...string_a_couper.length)
    est_separateur = false # Flag de séparation

    # Vérifie si le caractère est un séparateur
    for j in (0...string_separateur.length)
      if string_a_couper[i] == string_separateur[j]
        est_separateur = true
        break
      end
    end
    
    # Ajoute le mot au tableau s'il n'est pas vide
    if est_separateur # true
      tableau << string_decoupe unless string_decoupe.empty?
      string_decoupe = ''
    else # flag false
      string_decoupe << string_a_couper[i]
    end
  end

  # Ajoute le dernier mot s'il y en a un
  tableau << string_decoupe unless string_decoupe.empty?

  return tableau
end

# Gestion des erreurs
if ARGV.length != 1 || ARGV[0].nil? || ARGV[0].empty?
  puts 'error'
  exit
end

# Parsing des arguments
string_a_couper = ARGV[0]
string_separateur = [' ', "\t", "\n"]

# Exécution
tableau = decoupe(string_a_couper, string_separateur)

# Affichage du résultat
puts tableau
