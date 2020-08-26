require_relative 'formatter.rb' # modules must exist in the code before their include is first called
require_relative 'game.rb'
require_relative 'board.rb'

stop = false
until stop == true
   puts "--- Mastermind ---"
   puts "[1] Play"
   puts "[2] Description"
   puts "[3] Exit"
   input = gets.chomp.downcase
   if input == "1" || input == "play"
      game = Game.new
   elsif input = "2" || input == "description"
      puts "6 colors, 4 slots, 12 turns."
      puts "The colors are "\"R\", \"O\", \"Y\", \"G\", \"B\", and \"V\"."
      puts "The colors can be duplicated. The slots cannot be blank."
   elsif input == "3" || input == "exit"
      stop = true
      puts "--- --- ---"
   end
end