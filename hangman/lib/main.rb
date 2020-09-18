require 'json' # apparently not class-level. program-level?..
require_relative 'input'
require_relative 'hangman'

class Menu
   include Input
   def initialize
      Dir.chdir("../saves")
      $quit = false
      $limit = 7

      main_menu
      # hmm...
   end

   def main_menu
      until $quit == true
         puts "--- HANGMAN ---"
         puts "[1] Continue"
         puts "[2] New Game"
         puts "[3] Exit"

         select = gets.chomp.to_s.downcase
         case select
         when "1", "continue"
            file = load_game
            game = Game.new
            game.continue(file)
         when "2", "new"
            game = Game.new
            game.new_game
         when "3", "exit"
            $quit = true
         else
            input("menu", select)
         end
      end
   end

   def load_game
      return JSON.parse(File.read("testsave.json"))
   end

end

Menu.new # doesn't need to be stored in anything.