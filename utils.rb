# frozen_string_literal: true

# Utils — Reusable input validation helpers for AIR challenges

def empty_input?(string)
  i = 0
  while i < string.length
    return false if string[i] != ' '

    i += 1
  end
  true
end

def contains_empty_input?(array)
  i = 0
  while i < array.length
    return true if empty_input?(array[i])

    i += 1
  end

  false
end

def separator?(char, separators)
  i = 0
  while i < separators.length
    return true if char == separators[i]

    i += 1
  end

  false
end

def includes?(char, array)
  i = 0
  while i < array.length
    return true if char == array[i]

    i += 1
  end

  false
end

def count_occurrences(target, array)
  count = 0
  i = 0
  while i < array.length
    count += 1 if array[i] == target

    i += 1
  end

  count
end

def numeric_string?(string)
  return false if string.empty?

  i = 0
  i += 1 if ['+', '-'].include?(string[0])
  return false if i >= string.length

  while i < string.length
    char = string[i]
    return false if char < '0' || char > '9'

    i += 1
  end

  true
end

def numeric_arguments?(array)
  i = 0
  while i < array.length
    return false unless numeric_string?(array[i])

    i += 1
  end

  true
end

def valid_operator?(char)
  ops = ['+', '-', '*', '/']
  i = 0
  while i < ops.length
    return true if char == ops[i]

    i += 1
  end

  false
end

def valid_operand_format?(string)
  return false if string.length < 2

  operator = string[0]
  operand = string[1..]

  return false unless valid_operator?(operator)

  numeric_string?(operand)
end

def sorted?(numbers)
  i = 1
  while i < numbers.length
    return false if numbers[i] < numbers[i - 1]

    i += 1
  end
  true
end

def file_exists?(file_path)
  files = Dir.entries(Dir.pwd)

  i = 0
  while i < files.length
    return true if files[i] == file_path

    i += 1
  end

  false
end

def file_accessible?(file_path)
  File.open(file_path, 'r') { true }
rescue Errno::EACCES
  false
end

def file_empty?(file_path)
  size = 0

  File.open(file_path, 'r') do |file|
    while (line = file.gets)
      size += line.bytesize
    end
  end

  size.zero?
end
