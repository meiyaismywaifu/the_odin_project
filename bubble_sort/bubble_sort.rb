@array = [4,3,78,2,0,2]

# "did you remember to use .clone?", the problem:
def bubble_sort(array)
   previous = array.clone # did you remember?
   current = array.clone # did you remember?
   index = 0
   sorted = false

   until sorted do
      i = 0 #each while is one instance of going through.
      while i < array.length - 1
         left = i; right = i+1;
         if current[left]  > current[right]
            left_temp = current[left].clone # did you remember?
            right_temp  = current[right].clone # did you remember?
            current[right] = left_temp
            current[left] = right_temp
         end
         i += 1
      end

      if current == previous
         sorted = true
      else
         previous = current.clone # did you remember?
      end

   end

   p current

end

bubble_sort(@array)