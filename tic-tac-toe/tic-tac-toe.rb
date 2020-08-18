class Board
   attr_accessor :q, :w, :e, :a, :s, :d, :z, :x, :c

   def initialize
      @q, @w, @e, @a, @s, @d, @z, @x, @c = " "
   end

   def display
      # form "puts " #{q} | #{w} | #{e}""
   end

   def is_empty?
   end

   def mark
   end

end

class Game
   def initialize
      #initial... values? anything that needs to happen at startup.
      #call select and play
   end

   def select
      # x/o selection, loop.
      # e.g. @array = ["x", "o"]
      # stops on selection or exit
   end

   def play
      # the main loop: display, check win state, switch turn, ask for input
      # stops on win condition or exit.
      # if win condition, call intialize. this is loop->loop, not loop(loop)
   end

   def exit
      # confirmation
      # returns true or false value.
      # the loops/exits are elsewhere. unclear how to break loop from outside, or to delete/end this object, but this should be the same effect.
   end

end

new_game = Game.new