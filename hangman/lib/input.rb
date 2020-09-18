module Input
   # hm.. what could i put in here? if it's specific to a particular class then it's not really "modular". i suppose it doesn't have to be, it's a matter of organization, and "modules" are also "classes that don't need an instance".
   # the first idea is to find things easily. the second is to read things easily.

   # middleman function
   # this can manipulate instance vars in the class that calls it. so can do both valid input and correct guess checking here.
   def input (source, string)
      request = string.downcase.clone
      stop_commands = ["quit", "exit", "escape", "end", "stop"]

      case
      when request == "help"
         puts # game rules here
         # oh, i could do case/when under here for different sources.
         # could be its own method.
         puts "At any time you can also type any of the stop commands to quit."
         puts "The stop commands are #{stop_commands}."
         puts "--- --- ---"
         input(source, gets.chomp)
      when stop_commands.include?(request)
         #...this means you can't guess the word for hangman when it's these commands. unless...
         value = exit
         return value
      when source == "in_game"
         guess_validator(request)
      when source == "post_game"
         post_game(request)
      else
         puts "Please enter only valid commands. If you need help, type \"help\"."
      end
   end

   @@alphabet = ("a".."z").to_a # module has no instance
   def guess_validator(request)
      x = request.chars.select {|char| @@alphabet.include?(char)}
      # only contains alphabet characters
      if x.length == request.chars.length 
         # single character
         if x.length == 1
            # letter is not in "current" or "miss"
            if (@state["known_t"].include?(x.reduce).! &&
               @state["known_f"].include?(x.reduce).!) 
               check_letter(request)
            else
               puts "#{x.reduce} has already been guessed."
               guess_loop
            end
         # same length as "secret"
         elsif x.length == @state["secret"].length
            check_word(request)
         else
            puts "This word is not the correct length."
            guess_loop
         end
      else
         puts "Alphabetical characters only."
         guess_loop
      end
   end

   def guess_loop
      puts "Please enter a letter, or guess the word."
      input("in_game", gets.chomp)
   end

   def check_letter(character)
      checked = {}
      #word contains character
      if @state["secret"].include?(character)
         checked["known_t"] = character
         # reveal all instances of character
         checked["current"] = @state["current"].map.with_index do |slot, index|
            @state["secret"][index] == character ? slot = character : slot = slot
         end
      else
         checked["known_f"] = character
      end
      return checked
   end

   def check_word(word)
      checked = {}
      if @state["secret"] == word
         checked["hit"] == true
      else
         puts "That was not the right word."
         checked["hit"] == false
      end
      return checked
   end

   def post_game(request)
      # next game
         return "continue"
      # menu
         return #string
      # other: defaults to menu
         # error message
         return #string
   end

   def exit
      puts "Are you sure you want to quit? (Y/N)"
      input = gets.chomp.downcase
      if input == "y" || input == "yes"
         puts "Thank you for playing."
         puts "--- --- ---"
         return true
      elsif input == "n" || input == "no"
         puts "Returning to the game..."
         puts "--- --- ---"
         return false
      else
         puts "Neither \"Y\" nor \"N\" were input.\nReturning to the game..."
         puts "--- --- ---"
         return false
      end
   end
end