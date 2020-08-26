class Board
   include Formatter
   attr_reader :secret, :colors, :board

   def initialize
      @colors = %w[R O Y G B V]
      @board = "--- --- --- --- ----"
   end

   def secret_gen
      @secret = []
      4.times do
         @secret << @colors[rand(@colors.length)]
      end
   end

   def update_board(answer, guess, response) # see Game [3]
      top = 20 # new guesses are inserted above old guesses and below secret.
      if answer != true
         @board.insert(top,
            "\n#{guess} | #{response}" +
            "\n--- --- --- --- ----")
      else
         @board.insert(top,
            "\n#{guess} |     " +
            "\n--- --- --- --- ----")
         reveal = array_to_display(@secret.join, colors)["string"]
         @board.prepend(
            "#{reveal}       \n")
      end
   end

   def check(guess, secret)

      if guess == secret
         return true

      else
         keys = ""
         comparison = secret.clone
         # apparently method inputs aren't automatically local clones??
         # why would they do this

         # red
         remover = []
         guess.each_with_index do |color, index|
            if color == comparison[index]
               keys.prepend("x")
               remover << index
            end
         end
         remover = remover.reverse! # because arrays are refreshed each iteration.
         remover.each do |index|
            guess.delete_at(index)
            comparison.delete_at(index)
         end

         # white
         complete = false
         until complete == true
            switch = false
            guess.each_with_index do |color, index|
               if comparison.include?(color)
                  keys.prepend("o")
                  guess.delete_at(index)
                  comparison.delete_at(comparison.index(color))
                  switch = true
               elsif index == guess.length-1 && switch == false
                  complete = true
               end
            end
         end

         # blank
         guess.each do |color|
            keys.prepend("-")
         end
         return keys
         
      end
   end

end