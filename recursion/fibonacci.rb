# 0 1 1 2 3 5 8 13 21 34 55 etc.
# n = number of members to return
def fibs(n)
   return [0]   if n == 0
   return [0,1] if n == 1
   
   carrier = [0,1]
   (n-2).times{ carrier << (carrier[-1] + carrier[-2]) }
   return carrier
end


def fib(n)
   return [0]   if n == 0
   return [0,1] if n == 1
   
   return fib(n-1) << (fib(n-1)[-1] + fib(n-1)[-2]) #idrgi...
end

p fibs(5)