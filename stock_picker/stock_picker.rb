@array = [17,3,6,9,15,8,6,1,10]

def stock_picker(array)
   lowest = { position: 0, value: array[0]}
   known = {
      low_value: array[0], # apparently can't whitespace here, see notes.
      low_position: 0,
      high_value: array[0],
      high_position: 0,
      difference: 0,
   }

   array.each_with_index do |current, index|
      # low end
      if current < lowest[:value]
         lowest[:value] = current
         lowest[:position] = index
      end
      # high end
      if current - lowest[:value] > known[:difference]
         # values
         known[:low_value] = lowest[:value]
         known[:high_value] = current
         known[:difference] = known[:high_value] - known[:low_value]
         #positions
         known[:low_position] = lowest[:position]
         known[:high_position] = index
      elsif current - known[:low_value] > known[:difference]
         known[:high_value] = current
         known[:high_position] = index
      end
   end

   puts "[#{known[:low_position]},#{known[:high_position]}]"

end

stock_picker(@array)