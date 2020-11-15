require_relative 'node'
require_relative 'linked_list'

list = LinkedList.new
list.append(1)
p list.tail.value