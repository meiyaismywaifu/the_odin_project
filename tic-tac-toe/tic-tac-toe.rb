require 'matrix' #in stdlib, not in core

class Board
   attr_accessor :board

   def initialize
      @board = Matrix.build(3,3){|row, col| " "}
      @space = { "q" => [0,0], "w" => [0,1], "e" => [0,2],
                 "a" => [1,0], "s" => [1,1], "d" => [1,2],
                 "z" => [2,0], "x" => [2,1], "c" => [2,2]}
   end

   def display
      puts " #{@board[0,0]} | #{@board[0,1]} | #{@board[0,2]} "
      puts " -   -   - "
      puts " #{@board[0,1]} | #{@board[1,1]} | #{@board[1,2]} "
      puts " -   -   - "
      puts " #{@board[1,2]} | #{@board[2,1]} | #{@board[2,2]} "
   end

   def is_empty?(desired)
      row = @space[desired][0]
      column = @space[desired][1]
      return @board[row, column] == " "
   end

   def mark(player, desired)
      row = @space[desired][0]
      column = @space[desired][1]
      @board[row, column] = player
   end

   def complete?
      @board.row(0).each_with_index do |current, index|
         # Vector.to_s is garbage, and so is to_a.to_s
         row = @board.row(index).to_a.join
         if row == "XXX" || row == "OOO"
            return true
         end
         column = @board.column(index).to_a.join
         if column == "XXX" || column == "OOO"
            return true
         end
      end

      # diag has a built-in method but antidiag doesn't.
      # there is no way to rotate/flip with stdlib as of 2.7.
      # i'm not writing out an antidiag writer.
      diagonal = "#{@board[0,0]}#{@board[1,1]}#{@board[2,2]}"
      if diagonal == "XXX" || diagonal = "OOO"
         return true
      end
      antidiag = "#{@board[0,2]}#{@board[1,1]}#{@board[2,0]}"
      if antidiag == "XXX" || antidiag = "OOO"
         return true
      end
   end

end

class Game
   @@inputs = %w[q w e a s d z x c] 
   
   def initialize
      @board = Board.new
      select
   end

   def select
      internal = false
      
      until internal == true
         puts "Player 1, please enter either \"X\" or \"O\" as your mark."
         input = gets.chomp.upcase
         if input == "X"
            @player = ["X", "O"]
            puts "Player 1 is X. Player 2 is O."
            internal = true
         elsif input == "O"
            @player = ["O", "X"]
            puts "Player 1 is O. Player 2 is X."
            internal = true
         elsif input == "exit"
            internal = exit
         else
            puts "Please, either \"X\" or \"O\"."
         end
      end

      puts "--- --- ---"
      play #VSC doesn't recognize this as method?
   end

   def play
      internal = false
      @turn = 0

      until internal == true
         #display board
         @board.display
      
         # checks for win state
         if @turn > 4 && @board.complete?
            internal = true
            @turn -= 1
            next
         elsif @turn >= 9
            internal = true
            next
         end
         
         #input
         if @turn.even?
            current_player = @player[0]
            puts "Player 1 (#{@player[0]}):"
         else
            curernt_player = @player[1]
            puts "Player 2 (#{@player[1]}):"
         end

         desired = gets.chomp.downcase
         input = false

         until input = true
            if @@inputs.include?(desired) && @board.is_empty?(desired)
               input = true
               @board.mark(player, desired)
            elsif desired.include?("exit")
               internal = exit
               input = true
               @turn -=1
               next
            else
               "Please enter a valid space:"
               desired = gets.chomp
            end
         end         

         @turn += 1
         puts "--- --- ---"
            
      end

      victory
   end

   def victory
      if @board.complete?
         if @turn.even?
            puts "Player 1 wins."
         else
            puts "Player 2 wins."
         end
      else
         puts "The game is a draw!"
      end

      puts "The next game will begin shortly..."
      puts "--- --- ---\n--- ---\n---"

      initialize
   end

   def exit
      puts "Are you sure you want to exit? (Y/N)"
      input = gets.chomp.downcase
      if input == "y" || input == "yes"
         puts "Thank you for playing."
         return true
      elsif input == "n" || input == "no"
         puts "Returning to the game..."
         return false
      else
         puts "Neither \"Y\" nor \"N\" were input.\nReturning to the game..."
         return false
      end
   end

end

puts "This is a tic-tac-toe game. This description appears once."
puts "Both players are to be human."
puts "Selection of spaces on the board is via the keys q, w, e, a, s, d, z, x, and c."
puts "These keys will select the corresponding space on the board."
puts "At any time, you may type \"exit\" to exit the game."
puts "The game will now begin."
new_game = Game.new