class Board
   include Formatter
   attr_reader :secret, :colors

   def initialize
      @secret = []
      @colors = %w[R O Y G B V]
      @board = "--- --- --- --- ----"
   end

   def update_board(guess, response)
      top = 20
      if board.answer == false
         @board.insert(top,
            "\n#{guess} | #{response}" +
            "\n--- --- --- --- ----")
      else
         # change to prepend formatted secret
         @board.insert(top,
            "\n#{guess} |     " +
            "\n--- --- --- --- ----")
      end
   end

   def secret_gen
      4.times do
         @secret << @colors[rand(@colors.length)]
      end
   end

   def check(guess, secret)

      if guess == secret
         return true

      else
         keys = ""

         # red
         remover = []
         guess.each_with_index do |color, index|
            if color == secret[index]
               keys.prepend("x")
               remover << index
            end
         end
         remover = remover.reverse! # because arrays are refreshed each iteration.
         remover.each do |index|
            guess.delete_at(index)
            secret.delete_at(index)
         end

         # white
         complete = false
         until complete == true
            switch = false
            guess.each_with_index do |color, index|
               if secret.include?(color)
                  keys.prepend("o")
                  guess.delete_at(index)
                  secret.delete_at(secret.index(color))
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