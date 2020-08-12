@dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
   output_hash = Hash.new
   working_array = Array.new
   
   input_chars = string.downcase.chars
   input_chars.each do |character|
      if character ~= /[[:alpha:]]/
         working_array << character
      else
         working_array << " "
      end
   end

   working_string = working_array.join.split
   output_hash.default = 0

   working_string.each do |word|
      dictionary.each do |entry|
         if entry.include? word
            output_hash[entry] += 1
         end
      end
   end
   
   puts output_hash

end

puts ">>> This is a substring identifier. >>>"
loop do
   puts "String to dissect:"
   user_input = gets.chomp
   substrings(user_input, @dictionary)
   puts "--- --- ---"
end