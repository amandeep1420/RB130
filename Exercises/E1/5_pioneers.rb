# def decipher(name)
#   key     = ('a'..'z').to_a
#   letters = name.downcase.chars
  
#   letters.map do |letter|
#     begin
#       index = key.index(letter) + 13
#       index = index > 25 ? index - 26 : index
#       key[index]
#     rescue NoMethodError
#       letter
#     end
#   end.join('').split(' ').map(&:capitalize).join(' ')
# end

# puts decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")

# someone else's solution below

encrypted_names = [
  "Nqn Ybirynpr"
]

ALPHABET = ('a'..'z').to_a

def non_alphabetic?(char)
  !ALPHABET.include? char.downcase
end

def capital?(letter)
  letter == letter.upcase
end

def print_deciphered_name(encrypted_name)
  name  = ''
  encrypted_name.each_char do |char|
    next name << char if non_alphabetic?(char)

    idx = ALPHABET.index(char.downcase)
    actual_letter = ALPHABET[(idx + 13) % 26]
    actual_letter = actual_letter.upcase if capital?(char)
    name << actual_letter
  end
  puts name
end

encrypted_names.each do |name|
  print_deciphered_name(name)
end