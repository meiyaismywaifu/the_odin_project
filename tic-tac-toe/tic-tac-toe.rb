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
      p " #{@board[0,0]} | #{@board[0,1]} | #{@board[0,2]} "
      p " -   -   - "
      p " #{@board[0,1]} | #{@board[1,1]} | #{@board[1,2]} "
      p " -   -   - "
      p " #{@board[1,2]} | #{@board[2,1]} | #{@board[2,2]} "
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
         if row == "xxx" || row == "ooo"
            #return
         end
         column = @board.column(index).to_a.join
         if column == "xxx" || column == "ooo"
            # return
         end
      end

      # diag has a built-in method but antidiag doesn't.
      # there is no way to rotate/flip with stdlib as of 2.7.
      # and i'm not writing one out.
      diagonal = "#{@board[0,0]}#{@board[1,1]}#{@board[2,2]}"
      if diagonal == "xxx" || diagonal = "ooo"
         #return
      end
      antidiag = "#{@board[0,2]}#{@board[1,1]}#{@board[2,0]}"
      if antidiag == "xxx" || antidiag = "ooo"
         #return
      end
   end

end

class Game
   #apparently can't initialize values out here.
   def initialize
      @board = Board.new
      @inputs = %w[q w e a s d z x c] 
      #initial... values? anything that needs to happen at startup.
      #call select. note it's "select" not "game.select".
   end

   def select
      # x/o selection, loop.
      # e.g. @array = ["x", "o"]
      # selection calls play, exit calls exit.
   end

   def play
      # the main loop: until complete = true or exit = true
         # display: board.display
         # check win state: board.complete. if true, complete = true, break
            # start checking only after turn 5. this would be instance variable.
         # switch turn: ?
         # ask for input: board.is_empty then board.mark, or exit
         # draw divider line between loops here.
      # if win condition, call intialize. this is loop->loop, not loop(loop)
   end

   def exit
      # confirmation
      # returns true or false value.
      # the loops/exits are elsewhere. unclear how to break loop from outside, or to delete/end this object, but this should be the same effect.
   end

end

new_game = Game.new