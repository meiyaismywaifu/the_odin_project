#example
def append (array=[], integer)
   return array if integer < 0
   array << integer
   append(array, integer - 1)
end

#example
def rev_append (array=[], integer)
   return array if integer < 0
   rev_append(array, integer - 1)
   array << integer
end

#example
def fib(n)
   return 0 if n == 0
   return 1 if n == 1
   fib(n-1) + fib(n-2) # isn't this really inefficient?
end

# merge sort:
# halve cut until array size 1
# recompile up small left large right
# ..? isn't this like that binary thing?
#
# "sort the left half of the array (n>1)"
# "sort the right half of the array (n>1)"
# "merge two halves"
# ..this isn't helping.
#
# "on input of n elements
#    if n < 2
#       return
#    else
#       sort left half
#       sort right half
#       merge sorted halves"
# .........

# i think i understand how this works now.
# everything runs from top to bottom.
def merge_sort(array)
   if array.length < 2
      return array
   else
      middle = array.length/2.floor-1
      left = merge_sort(array[0..middle])
      right = merge_sort(array[middle..(array.length-1)])
# the below doesn't start until arrays are length 1.
# the method will call itself until that point, because that's what's defined in [44].
# if the array is size 8, first call does not in fact "make right and left arrays of size 4". this is what's in the video visualizations but this is incomplete.
# "left" at first call is not "array of size 4" but "method(array of size 4)", which is indeterminate until that method has completed. the method in this case calls itself, which will continue to call itself until [44].
# the code below then executes. when it finishes, it passes its results to the previous method that called it, e.g. "left" is now actually "array of size 4".

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

# wao
until array1.empty? || array2.empty? # evades nil comparison
   mergedarray << if array1[0] <= array2[0]
                    array1.shift
                  else
                    array2.shift
                  end
 end
 mergedarray.concat(array1, array2) # evades nil comparison
# https://github.com/teshigahara/merge-sort/blob/master/merge_sort.rb