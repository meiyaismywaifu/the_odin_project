def merge_sort(array)
   if array.length < 2
      return array
   else
      middle = array.length/2.floor-1
      left = merge_sort(array[0..middle])
      right = merge_sort(array[middle..(array.length-1)])
      sorted = []

      until left.length == 0 && right.length == 0
         case
         when right.length == 0
            sorted << left.slice!(0) 
         when left.length == 0
            sorted << right.slice!(0)
         when left[0] < right[0]
            sorted << left.slice!(0) 
         when right[0] < left[0]
            sorted << right.slice!(0)
         end
      end
      
      return sorted
   end
end

array = [4,8,6,2,1,7,5,3]
p merge_sort(array)