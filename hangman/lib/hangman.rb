require 'json'
require_relative 'input'

class Game
   include Input
   include Dictionary
   def initialize(settings)
      load_dic
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
      remain = @state["remain"]
      first_turn = true # first turn since loading

      puts #intro message here
      previous_state = @state.clone

      # main loop
      until @stop == true || @answer == true || remain <= 0
         checked = input("in_game",gets.chomp) # hash
         (@stop = true; break) if checked == true # break has to come last

         save(previous_state) unless first_turn == true
         previous_state = @state.clone
         @state.merge(checked)
            # this is not trivial.

         if @state["secret"] == @state["current"].join || checked["hit"] == true
            @answer = true
         elsif checked["known_t"] != nil
            # hm..?
         else
            @state["remain"] -= 1
            remain -= 1
         end

         display
         first_turn = false
      end

      # completion
      case
      when @answer == true
         puts "Congratulations."
      when remain <= 0
         put "The man has been hanged."
         puts "The word was \"#{@state["secret"]}\"."
      end
      
      # postgame input
      puts "[1] new game / [2] main menu / [3] quit ?"
      unless @stop == true
         command = input("post_game", gets.chomp)
         case
         # new game
         when command == "continue"
            clear_state
            new_word
            hangman
         # quits game and menu
         when command == true 
            $quit = true
         # returns to main menu automatically.
         else 
         end
      end

   end

   def display
      
   end

   def save(state, name="autosave") # defaults assigned at method declaration
      # states should be instance scope
      # autosave only: pass previous state
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
         "remain"  => $limit.clone}
   end
   
end