require_relative 'node'

class LinkedList
   attr_reader :size, :head, :tail

   def initialize
      @size = 0
      @head = nil
      @tail = nil
   end

   def move(node)
      unless node.next_node == nil
         return ObjectSpace._id2ref(node.next_node)
      else
         return Node.new
      end
   end

   def append(value)
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
      if @head.nil?
         node = Node.new(value)
         @head = node; @tail = node
      else
         node = Node.new(value, @head.object_id)
         @head = node
      end
      @size += 1
   end

   def at(index)
      node = @head
      index.times do
         node = move(node)
      end
      return node
   end

   def pop
      node = at(@size-2)
      @tail = node; node.next_node = nil
      @size -= 1
   end

   def contains?(value)
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
      node = at(index)
      newnode = Node.new(value, node.next_node)
      node.next_node = newnode.object_id
      @size += 1
   end

   def remove_at(index)
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
