require_relative 'node'

class LinkedList
   attr_reader :size, :head, :tail
   # size int, head node, tail node

   def initialize
      @size = 0
      @head = nil
      @tail = nil
   end

   def append(value)
   # add node to end
      node = Node.new(value)
      if @head.nil?
         @head = node; @tail = node
      else
         @tail.next_node = node
         @tail = node
      end
   end

   def prepend(value)
   # add node to start
      if @head.nil?
         node = Node.new(value)
         @head, @tail = node, node
      else
         node = Node.new(value, @head)
         @head = node
      end
      @size += 1
   end

   def at(index)
   # return spec node
      # head; call nextnode index times
      # return current node
   end

   def pop
   # remove last node
      # node = at(size-1)
      # node = tail and nextnode = nil
   end

   def contains?(value)
   # true if value is in any node, false otherwise
      # run all nodes until nextnode = nil or == condition is true
      # if true then true, else false
   end

   def find(value)
   # index if value is in node (return multiple?), nil otherwise
      # run all nodes until nextnode = nil
      # if true, store index in string. return string at end. string default nil.
   end

   def to_s
   # string. format:
   # ( value ) -> ( value ) -> ( value ) -> nil
   end

   def insert_at(value, index)
   # insert value at index
   end

   def remove_at(index)
   # remove at index
   end

end
