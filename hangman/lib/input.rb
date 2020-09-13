module Input
   # hm.. what could i put in here? if it's specific to a particular class then it's not really "modular". i suppose it doesn't have to be, it's a matter of organization, and "modules" are also "classes that don't need an instance".
   # the first idea is to find things easily. the second is to read things easily.

   ### incomplete ###
   def input (source, string)
      request = string.downcase.clone
      stop_commands = ["quit", "exit", "escape", "end", "stop"]
      action = { "valid"  => false,
                 "select" => nil  }

      case
      when request == "help"
         puts # game rules here
         puts "At any time you can also type any of the stop commands to quit."
         puts "The stop commands are #{stop_commands}."
         puts "--- --- ---"
         return action
      when stop_commands.include?(request)
         value = exit
         @stop, action["valid"] = value, value
         return action

      # hmm. i want to be able to call help/exit at any time. which means everything has to pass through here. right? yeah, unless i want to duplicate it. so this is a middleman function. which means if there are no help/exit, it needs to then continue to wherever it was 'supposed' to go.

      # sources: menu, in-game, post-game
      # menu had its choices already, go to final error from here
      # this can manipulate instance vars in the class that calls it. so can do both valid input and correct guess checking here.
   end

   def exit
      puts "Are you sure you want to stop? (Y/N)"
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