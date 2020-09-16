require 'json' # apparently not class-level. program-level?..
require_relative 'input.rb'

class Game
   include Input
   def initialize(settings)
      # read from settings
      # trim dictionary to match settings, save modified dictionary
         # would be nice to only change if... oh i can.
         # unless exists, save dictionary settings
         # load dictionary settings. if not identical to current settings, write new dictionary.
         # do it in CSV.

      # dictionary initialize
      @dic_size = 0
      @dic_name = "5desk.txt"
      File.open(@dic_name, "r").each_line.with_index do |line, index|
         @dic_size += 1
      end
   end

   # game initialize
   def new_game
      clear_state
      new_word
      hangman
   end
   def continue(savefile)
      @state = savefile
      hangman
   end

   # main loop
   def hangman
      @stop = false
      @answer = false
      miss = 0 # this should read from @state instead.
      first_turn = true # first turn since loading

      puts #intro message here
      previous_state = @state.clone

      # main loop
      until @stop == true || @answer == true || miss > @limit
         checked = input("in_game",gets.chomp) # hash

         save(previous_state) unless first_turn == true
         previous_state = @state.clone
         @state.merge(checked)
         display

         if # true == current
            @answer = true
         else
            miss += 1
         end
         first_turn = false
      end

      # completion message
      case
      when @answer == true
         # victory
      when miss > 7
         # defeat
         # reveal word
      end

      # autosave..? hm? loading after a completed game should be a new game..
      # oh right, it'd be here if i wanted to keep winrates.
      
      # postgame input
      # new game / main menu / quit
      unless $quit == true || @stop == true
         command = input("post_game", gets.chomp)
         case
         when command == "continue"
            clear_state
            new_word
            hangman
         when command == true # quits game and menu
            $quit = true
         else # returns to main menu automatically.
         end
      end

   end

   def display
      
   end

   def save(state, name="autosave") # defaults assigned at method declaration
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
         "known_t" => [] # what's wrong with just using current?
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

   # def new_dic
   # end

end

class Menu
   include Input
   def initialize
      Dir.chdir("../saves")
      $quit = false
      #load_settings
      @settings = {     # scope creep prevention
         "min_size"     => 5
         "max_size"     => 12
         "guess_limit"  => 7
      }
      main_menu
      # hmm...
   end

   def main_menu
      until $quit == true
         # display

         select = gets.chomp.to_s.downcase
         case select
         when "1", "continue"
            file = load_game("autosave")
            game = Game.new(@settings)
            game.continue(file)
         when "2", "new"
            game = Game.new(@settings)
            game.new_game
         # when #load
         #    # hmmm... display saves. this keeps getting bigger.
         #    file = load_game(gets.chomp)
         #    game = Game.new(@settings)
         #    game.continue(file)
         # when #settings
         #    settings_menu
         when "5", "exit"
            $quit = true
         else
            input("menu", select)
         end
      end
   end

   def load_game(name)
      # load file
      # format json to hash
      # return hash
   end

   # def settings_menu
   #    # hmm. passing this through middleman seems like a pain.
   #    # ...problem of designing a better middleman.
   #    options = true
   #    until options == false
   #       # display

   #       # minimum word size (smaller than max)
   #       # maximum word size (larger than min)
   #       # allowed misses (whole numbers)
   #       # save settings
   #       # return to main menu (warning if settings haven't been saved)
   #    end
   # end

   # def load_settings # to a @settings hash
   # end

   # def save_settings
   # end

end

Menu.new # doesn't need to be stored in anything.