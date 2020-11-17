class Node
   attr_accessor :value, :next_node

   @value = nil
   @next_node = nil

   def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
   end

   # def next
   #    return ObjectSpace._id2ref(next_node)
   # end
   #    this works fine but
   #     - next is a reserved word
   #     - better in linkedlist class

   # def value
      # value would need an input..
      # ..what's wrong with using attr_accessor? need instance variable anyway.
      # what does "#value method and a link to the #next_node"??? "link" isn't a thing in ruby, not something next to "method". who wrote this? why does there need to be a method for value? what???
      # now i have to suspect everything else.
   # end
end
