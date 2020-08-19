class Board
   attr_accessor :board

   def initialize
      @board = Matrix.build(3,3){|row, col| " "}
      @coordinates = { "q" => [0,0], "w" => [0,1], "e" => [0,2],
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

   def is_empty?(coordinate)
      # @board[x, x] == " "
   end

   def mark(player, coordinate)
      # @board[x, x] = input
         # this is not in ruby 2.5. 2.7 has it. so can't check on repl.it
         # why would matrix exist without a way to write to it?
   end

   def complete?
      # for row_count, convert row to string etc. true if xxx or ooo.
      # for column count
      # diagonal 1: [0,0], [1,1], [2,2]
      # diagonal 2: [0,2], [1,1], [2,0]
      # Matrix does not come with "each row", only each element.
   end

end

class Game
   #apparently can't initialize values out here.
   def initialize
      @board = Board.new
      @inputs = %w[q w e a s d z x c] 
      #initial... values? anything that needs to happen at startup.
      #call select
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