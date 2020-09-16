module Input
   # hm.. what could i put in here? if it's specific to a particular class then it's not really "modular". i suppose it doesn't have to be, it's a matter of organization, and "modules" are also "classes that don't need an instance".
   # the first idea is to find things easily. the second is to read things easily.

   # middleman function
   # this can manipulate instance vars in the class that calls it. so can do both valid input and correct guess checking here.
   def input (source, string)
      request = string.downcase.clone
      stop_commands = ["quit", "exit", "escape", "end", "stop"]
      action = { "valid"  => false,
                 "select" => nil  } #hmm...

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

   def guess_validator(request)      
      if # only contains alphabet characters
         if # one character
            if # letter is not in "current" or "miss"
               check_letter(request)
            else
               # error "used before"
               input("in_game", gets.chomp)
            end
         else # multiple characters
            if # same length as "true"
               check_word(request)
            else
               # error "guess wrong length"
               input("in_game", gets.chomp)
            end
         end
      else
         # error "alphabetical characters only"
         input("in_game", gets.chomp)
      end

   end

   def check_letter(character)
      if #word contains character
         # until previous and current index are the same
         # reveal said character in ["current"]
      else
         # add character to ["miss"]
      end
      return @checked
   end

   def check_word(word)
      if @state["true"] == word
         # word: string to array
         @checked["current"] = # that array
      else
         puts "That was not the right answer."
         @checked["current"] = @state["current"]
      end
      return @checked
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