# frozen_string_literal: true

# 🎉 Air: Ok - Celebrate Your Victory! 🎉

# Vérifie si un adjectif est fourni en argument, sinon utilise un adjectif par défaut
adjective = ARGV[0] || "éprouvant"

# Affiche le message de célébration
puts "J’ai terminé l’Épreuve de l’Air et c’était #{adjective} !"
