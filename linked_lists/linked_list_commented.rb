require_relative 'node'
# this is the commented version.
class LinkedList
   attr_reader :size, :head, :tail
   # size int, head node, tail node

   def initialize
      @size = 0
      @head = nil
      @tail = nil
   end

   def move(node)
   # returns next node
   # returns blank node to terminate sequences otherwise
      if node.next_node != nil
         return ObjectSpace._id2ref(node.next_node)
      else
         return Node.new
      end
   end

   def append(value)
   # add node to end
      # new list = populate values
      # otherwise modify tail only
      node = Node.new(value)
      if @head.nil?
         @head = node; @tail = node
      else
         @tail.next_node = node.object_id
         @tail = node
      end
      @size += 1
   end

   def prepend(value)
   # add node to start
      # new list = populate values
      # otherwise modify head only
      if @head.nil?
         node = Node.new(value)
         @head, @tail = node, node
      else
         node = Node.new(value, @head.object_id)
         @head = node
      end
      @size += 1
   end

   def at(index)
   # return spec node
      # head; call nextnode index times
      # return current node
      node = @head
      index.times do
         node = move(node)
      end
      return node
   end

   def pop
   # remove last node
      # node = at(size-2)
      # node = tail and nextnode = nil
      node = at(@size-2)
      @tail = node; node.next_node = nil
      @size -= 1
   end

   def contains?(value)
   # true if value is in any node, false otherwise
      # run all nodes until nextnode = nil or == condition is true
      # if true then true, else false
      node = @head
      result = false
      until node.value == nil && node.next_node == nil
         if node.value == value
            result = true
            break
         end
         node = move(node)
      end
      return result
   end

   def find(value)
   # index if value is in node (return multiple?), nil otherwise
      # run all nodes until nextnode = nil
      # if true, store index in string. return string at end. string default nil.
      node = @head
      index = 0; result = ""; found = false
      until node.value == nil && node.next_node == nil
         if node.value == value
            found = true
            if result != ""
               result << " #{index.to_s}"
            else
               result << index.to_s
            end
         end
         index += 1
         node = move(node)
      end
      return result if found == true
   end

   def to_s
   # string. format:
   # ( value ) -> ( value ) -> ( value ) -> nil
      node = @head
      result = ""
      until node.next_node == nil
         result << "( #{node.value} ) -> "
         node = move(node)
      end
      result << "( #{node.value} ) -> nil"
      return result
   end

   def insert_at(index, value)
   # insert value at index
      # at(index) returns node
      # new node, next as given's next, given's next as this, size +1
      node = at(index)
      newnode = Node.new(value, node.next_node)
      node.next_node = newnode.object_id
      @size += 1
   end

   def remove_at(index)
   # remove at index
      # point node before to node after
      # special cases for head and tail
      case index
      when 0
         node = at(1)
         @head.value = nil; @head.next_node = nil
         @head = node
      when @size-1
         pop
      else
         node = at(index)
         antenode = at(index-1)
         postnode = at(index+1)
         node.value = nil; node.next_node = nil
         antenode.next_node = postnode.object_id
      end
      @size -= 1
   end

end
