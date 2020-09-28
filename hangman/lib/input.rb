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
         help(source)
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
      word = @state["secret"].downcase
      #word contains character
      if word.include?(character)
         checked["known_t"] = character        
         # reveal all instances of character
         checked["current"] = @state["current"].map.with_index do |slot, index|
            word[index] == character ? slot = character : slot = slot
         end

         # re-upcase when relevant
         if word != @state["secret"] && word[0] == character
            checked["current"][0].upcase!
         end

      else
         checked["known_f"] = character
      end
      return checked # either [current, known_t], or [known_f]
   end

   def check_word(word)
      checked = {}
      if @state["secret"] == word
         checked["current"] = word.chars
         checked["hit"] = true
      else
         puts "That was not the right word."
         checked["hit"] = false
      end
      return checked # either true or false
   end

   def post_game(request)
      case request.downcase
      when "1", "new game", "continue"
         return "continue"
      when "2", "main menu", "menu"
         # upstream defaults to menu
      when "3", "quit", "exit", "escape", "end", "stop"
         return true
      else
         puts "Unrecognized command."
         puts "Returning to main menu..."
         # upstream defaults to menu
      # ..this is probably so simple because it's so far downstream. upstream could use cleaning... but that's also not here.
      end
   end

   def help(source)
      case source
      when "menu"
         puts "This is a menu. It shouldn't be hard to use a menu."
         main_menu
      when "in_game"
         puts "Enter a letter, or guess the word."
         puts "Proper nouns will auto-capitalize for you."
         puts "Guessing the word is free."
      when "post_game"
         puts "This is a menu. It shouldn't be hard to use a menu."
         puts "And now, another menu."
      end
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