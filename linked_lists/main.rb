require_relative 'node'
require_relative 'linked_list'
# this is the tester.
list = LinkedList.new
   
thingy = %w[a a a d e f g]
thingy.each do |item|
   list.append(item)
end

list.pop
p list.to_s
p list.size
p list.head.value
p list.tail.value
p list.at(2).value
p list.contains?("f")
p list.find("a")
p list.insert_at(2,"c")
p list.to_s
list.remove_at(3)
p list.to_s