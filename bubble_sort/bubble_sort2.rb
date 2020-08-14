@array = [4,3,78,2,0,2]

# "did you remember to use .clone?", "did you also remember ==?" edition:
def bubble_sort(array)
   previous = array.clone # did you remember?
   current = array.clone # did you remember?
   index = 0
   sorted = false

   until sorted do
      index >= array.length - 1 ? index = 1 : index += 1
      left = index - 1; right = index.clone

      if current[left]  > current[right]
         left_temp = current[left].clone # did you remember?
         right_temp  = current[right].clone # did you remember?
         current[right] = left_temp
         current[left] = right_temp
      end

      # executes every time we hit the end
      if index == array.length - 1 # did you remember?
         if current == previous # did you remember?
            sorted = true
         else
            previous = current.clone
         end
      end

   end

   p current

end

bubble_sort(@array)