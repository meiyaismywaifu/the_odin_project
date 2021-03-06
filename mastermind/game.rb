class Game
   include Formatter
   # attr_reader :answer
   # board cannot read from here, since it is within game.
   # i thought game and board could be siblings under main but it seems siblings can't read across, and is actually the parent reading from both.
   # apparently global is another way around this but that's annoying.
   # this affects "update_board", ups inputs to include @answer from Game.

   def initialize
      @board = Board.new
      select
   end

   def select
      valid = false
      until valid == true
         puts "Please select to play as either \"coder\" or \"breaker\"."
         puts "(don't actually select coder)"
         choice = gets.chomp
         selection = input("select", choice)
         valid = selection["valid"]
      end
      if selection["select"] == "breaker"
         breaker
      elsif selection["select"] == "coder"
         coder
      end
   end

   def coder
      # assign secret
      # until guess == true || turn >12 || stop == true
         # computer generates guess
            # ...how would i do this? this seems complicated for anything remotely reasonable. do i care to spend the time on this?
            # it would need to remember its previous guess at least...
            # ..more than its previous guess.
            # yeah i don't think i'm gonna do this.
      puts "Don't actually select coder."
      puts "--- --- ---"
      select
         # user input: up to 4 chars, must be either o or x.
         # input as string, move o's to left and x's to right, fill -'s on left
         # run check, if disagree with input, add turn to complaint array
         # if xxxx, guess = true, end game.
         # display board
      # if game ends without guess == true, display complaint array if not nil.
   end

   def breaker
      @answer = false
      @stop = false
      @turn = 1
      @board.secret_gen

      #turn
      until @answer == true || @turn > 12 || @stop == true

         # guess
         valid = false
         until valid == true
            if @turn == 1; puts "Please enter your guess."
            else; puts "Please enter your next guess."; end
            guess = gets.chomp
            valid = input("breaker", guess)["valid"] # key "valid" of input's returned hash
         end

         unless @stop
            # format input
            formatted = array_to_display(guess, @board.colors)
            response = @board.check(formatted["array"], @board.secret)
            @answer = true if response == true
            @board.update_board(@answer, formatted["string"], response)
            puts @board.board
            @turn += 1 unless @answer == true
         end
      end

      complete unless @stop == true
   end

   def complete
      if @answer == true
         puts "Congratulations."
      elsif @turn > 12
         reveal = array_to_display(@secret, colors)["string"]
         puts "You have run out of time."
         puts "The secret was: #{reveal}"
         puts "--- --- ---"
      end

      puts "Would you like to play again? (Y/N)"
      continue = gets.chomp
      valid = input("complete", continue)["valid"]

      if valid == true && continue.include?("y")
         # should be initialize, but since i haven't actually done the coder side
         @board = Board.new
         breaker
      end

   end

   # input validator
   def input (source, string)
      stop_commands = ["quit", "exit", "escape", "end", "stop"]
      action = { "valid"  => false,
                 "select" => nil  }

      if string.downcase == "help"
         puts "The valid inputs in guessing are any combination of the characters"
         puts "\"R\", \"O\", \"Y\", \"G\", \"B\", \"V\", \" \", \"-\", \",\", and \".\""
         puts "At any time you can also type any of the stop commands to quit."
         puts "The stop commands are #{stop_commands}."
         puts "--- --- ---"
         return action
      elsif stop_commands.include?(string.downcase)
         value = exit
         @stop, action["valid"] = value, value
         return action

      else
         case source

         when "select"
            string_internal = string.downcase
            case string_internal
            when "breaker"
               action["select"] = "breaker"
               action["valid"] = true
               return action
            when "coder"
               action["select"] = "coder"
               action["valid"] = true
               return action
            else
               puts "Please enter a valid command."
               return action
            end

         when "breaker"
            string_internal = string.upcase
            string_chars = string_internal.chars
            valid_set = @board.colors.clone << " " << "-" << "," << "."
            color_count = 0

            string_chars.each do |character|
               if valid_set.include?(character) == false
                  puts "Invalid characters were detected."
                  return action
               elsif @board.colors.include?(character)
                  color_count += 1
                  if color_count > 4
                     puts "Please enter no more than 4 colors."
                     return action
                  end
               end
            end

            action["valid"] = true
            return action

         when "coder"
            # n/a

         when "complete"
            string = string.downcase
            case string
            when "y", "yes"
               puts "--- --- ---"
               action["valid"] = true
               return action
            when "n", "no"
               puts "Thank you for playing."
               puts "--- --- ---"
               action["valid"] = true
               return action
            else
               puts "Unknown response. Returning to menu."
               return action
            end
          end

      end
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