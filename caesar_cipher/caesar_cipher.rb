@alphabet_reference = ("a".."z").to_a # scope works differently from javascript

def caesar_cipher(string, integer)
   ciphered_string = ""
   cipher_reference = @alphabet_reference.rotate(integer) # rotate wheel
   string_chars = string.chars # convert to array

   string_chars.each do |character|
      lowercase = character.downcase
      
      if @alphabet_reference.include?(lowercase)
          original = @alphabet_reference.index(lowercase)
          if lowercase != character
            ciphered_string << cipher_reference[original].upcase
          else
            ciphered_string << cipher_reference[original]
          end
          
      else
          ciphered_string << character

      end
    end
   puts ciphered_string
end
   
loop do
   puts "String to encode:"
   input_string = gets.chomp
   puts "Shift by:"
   input_integer = gets.chomp

   until input_integer =~ /\A[-+]?[0-9]*\Z/
      puts "Please enter a valid integer:"
      input_integer = gets.chomp
   end
   input_integer = input_integer.to_i

   puts "Encoded string:"
   caesar_cipher(input_string, input_integer)
   puts "--- --- ---"
end