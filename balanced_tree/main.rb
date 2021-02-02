require_relative 'node'
require_relative 'tree'
# this is the tester

# array = [4,8,6,2,1,7,5,3,9]
# tree = Tree.new(array)
# tree.root = tree.build_tree
# tree.pretty_print

array = (Array.new(15) { rand(1..100) })
tree = Tree.new(array)
tree.root = tree.build_tree
tree.pretty_print
p "balanced?: #{tree.balanced?}"
p "level order: #{tree.level_order}"
p "preorder: #{tree.preorder}"
p "inorder: #{tree.inorder}"
p "postorder: #{tree.postorder}"
5.times do tree.insert(rand(100..200)) end
tree.pretty_print
p "balanced?: #{tree.balanced?}"
tree.root = tree.rebalance
tree.pretty_print
p "balanced?: #{tree.balanced?}"
p "level order: #{tree.level_order}"
p "preorder: #{tree.preorder}"
p "inorder: #{tree.inorder}"
p "postorder: #{tree.postorder}"