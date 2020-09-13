require 'json' # apparently not class-level. program-level?..
require_relative 'input.rb'

class Game
   include Input
   def initialize
      @dic_size = 0
      @dic_name = "5desk.txt"
      File.open(@dic_name, "r").each_line.with_index do |line, index|
         @dic_size += 1
      end
   end

   # initializations
   def new_game
      clear_state
      new_word
      hangman
   end
   def continue(savefile)
      @state = savefile
      hangman
   end

   def hangman
      @exit = false
      @answer = false
      # main loop
      until @exit == true || @answer == true || @miss > 7
         # get/check input loop
            # can i set this as a separate method and loop there? is that allowed?
         # autosave previous state, unless previous == current (i.e. just loaded)
         # previous state = clone current state
         # update current state
         # display current state
      end

      # completion
      case
      when #answer == true
         # victory
      when #miss > 7
         # defeat
         # reveal word
      end

      # autosave..? hm? loading after a completed game should be a new game..
      # oh right, it'd be here if i wanted to keep winrates.
      
      # "continue?"
      # input
      case
      when # hang the next man
         clear_state
         new_word
         hangman
      when # exit
         #hmm... this would be a global variable wouldn't it.
         $quit = true
      else # menu
         # will do so on its own
      end

   end

   def save(state, name="autosave") # "autosave" is default value
      # states should be instance scope
      # autosave will pass the previous state
      # manual save will pass current state
      File.open("#{name}.json", "w") do |f|
         f.write(JSON.pretty_generate(game_file))
      end
   end

   def clear_state
      @state = {
         "secret"  => nil
         "current" => []
         "known_t" => []
         "known_f" => []
         "misses"  => 0    }
   end
   
   # readlines holds entire file in memory.
   # readline can't target a specific line..
   # apparently enumerating is faster. or so people say.
   def new_word
      Dir.chdir("../lib")

      pick = rand(@dic_size + 1) # rand is not top-inclusive
      File.open(@dic_name, "r").each_line.with_index do |line, index|
         if index == pick
            @state["secret"] = line
            break
         end
      end
      
      Dir.chdir("../saves")
   end

end

class Menu
   include Input
   def initialize
      Dir.chdir("../saves")
      $quit = false
      # hmm...
   end

   # menu
   until $quit == true
      # display: continue / new / load / exit
      # it'd be pretty cool if we could have a setting here for allowed misses
      input = gets.chomp.downcase
      case input
      when #continue
         # call autosave
         game = Game.new
         game.continue(file)
      when #new
         game = Game.new
         game.new_game
      when #load
         # call specific file
         game = Game.new
         game.continue(file)
      when #exit
         $quit = true
      else
         # push to module
      end
   end

end

Menu.new # doesn't need to be stored in anything.