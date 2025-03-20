# frozen_string_literal: true

# Afficher le contenu
# Programme qui affiche le contenu d'un fichier donné en argument.
# Afficher error et quitter le programme en cas de problèmes d'arguments ou de fichier inaccessible.

# ---------- Utility Functions ----------

def read_file(file_path)
  content = ''
  file = File.new(file_path, 'r')

  while (line = file.gets)
    content += line
  end

  file.close
  
  content
end

# ---------- Error Handling ----------

def validate_arguments(arguments)
  return 'error: 1 file expected' unless single_argument?(arguments)

  file_path = arguments[0]
  return 'error: file not found' unless file_exists?(file_path)
  return 'error: file not accessible' unless file_accessible?(file_path)
  return 'error: file is empty' if file_empty?(file_path)
end

def single_argument?(arguments)
  arguments.size == 1
end

def file_exists?(file_path)
  found = false
  files = `ls`.split("\n")

  i = 0
  while i < files.length
    if files[i] == file_path
      found = true
      break
    end
    i += 1
  end

  found
end

def file_accessible?(file_path)
  accessible = false
  files = `ls -l`.split("\n") # Récupère la liste des fichiers avec permissions

  i = 0
  while i < files.length
    details = files[i].split # Divise la ligne en mots (permissions, propriétaire, etc.)
    
    if details[-1] == file_path
      permissions = details[0] # Récupère la colonne des permissions (ex: "-rw-r--r--")
      accessible = permissions[0] != 'd' && permissions[1] != '-'
      break
    end
    i += 1
  end

  accessible
end

def file_empty?(file_path)
  size = 0
  File.open(file_path, "r") do |file|
    file.each_line { |line| size += line.bytesize }
  end
  size == 0
end

# ---------- Parsing Arguments ----------

def retrieve_arguments()
  arguments = ARGV
end

# ---------- Problem Solving ----------

def display_file_content()
  arguments = retrieve_arguments()
  error_message = validate_arguments(arguments)
  return error_message if error_message

  return read_file(arguments[0])
end

# ---------- Execution ----------

puts display_file_content()
