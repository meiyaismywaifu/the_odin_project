require 'json'
require_relative 'input'
require_relative 'dictionary'

class Game
   include Input
   include Dictionary
   def initialize
      load_dic
   end

   # game initialize
   def new_game
      clear_state
      new_word
      display
      hangman
   end
   def continue(savefile)
      @state = savefile
      display
      hangman
   end

   # main loop
   def hangman
      @stop = false
      @answer = false
      remain = @state["remain"] ## this doesn't link the two? mb "deep" problems.
      previous_state = deep_copy(@state)
      first_turn = true # first turn since loading

      puts "--- HANGMAN ---"
      puts "Enter a letter, or guess the word."

      # main loop
      until @stop == true || @answer == true || @state["remain"] <= 0
         checked = input("in_game",gets.chomp) # hash
         (@stop = true; break) if checked == true # break has to come last

         previous_state = deep_copy(@state)
         state_merge(checked)
         save(previous_state) unless first_turn == true # && current is empty..?

         # complete?
         if @state["secret"] == @state["current"].join || checked["hit"] == true
            @answer = true
         end

         display
         first_turn = false
      end

      # completion
      case
      when @answer == true
         puts "Congratulations."
      when @state["remain"] <= 0
         puts "The man has been hanged."
         puts "The word was \"#{@state["secret"]}\"."
      end
      
      # postgame input
      puts "[1] new game / [2] main menu / [3] quit ?"
      unless @stop == true
         command = input("post_game", gets.chomp)
         case
         # new game
         when command == "continue"
            new_game
         # quits game and menu
         when command == true 
            $quit = true
         # returns to main menu
         else 
         end
      end

   end

   def display
      # 7 | _ _ _ _ _ | a, b, c
      current = @state["current"].join(" ")
      known_f = @state["known_f"].join(", ")
      puts "#{@state["remain"]} | #{current} | #{known_f}"
      puts "--- --- --- ---"
   end

   def state_merge(checked)   
      case # i like if/else, but case/when/else being same length is really nice
      when checked["current"] != nil
         @state["current"] = checked["current"].clone
         @state["known_t"].push(checked["known_t"])
      when checked["known_f"] != nil
         @state["known_f"].push(checked["known_f"])
         @state["remain"] -= 1
      end
   end
   
   def deep_copy(hash) # see thinking [420~505]
      return JSON.parse(hash.to_json)
   end

   def save(state, name="autosave") # defaults assigned at method declaration
      File.open("#{name}.json", "w") do |f|
         f.write(JSON.pretty_generate(state))
      end
   end

   def clear_state
      @state = {
         "secret"  => nil,
         "current" => [],
         "known_t" => [],
         "known_f" => [],
         "remain"  => $limit.clone
      }
   end
   
end