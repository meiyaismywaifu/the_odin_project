require 'json' # apparently program-level. scope-independent?
               # good practice to keep these here anyway.
require_relative 'input'
require_relative 'hangman'

class Menu
   include Input
   def initialize
      Dir.chdir("../saves")
      $quit = false
      $limit = 7
      main_menu
   end

   def main_menu
      until $quit == true
         puts "--- --- --- ---"
         puts "--- HANGMAN ---"
         puts "[1] Continue"
         puts "[2] New Game"
         puts "[3] Exit"

         select = gets.chomp.to_s.downcase
         case select
         when "1", "continue"
            game = Game.new
            game.continue(load_game)
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
      return JSON.parse(File.read("autosave.json"))
   end

end

Menu.new # doesn't need to be stored in anything.