require_relative 'node'
require_relative 'tree'
# this is the tester

# (`Array.new(15) { rand(1..100) }`)
# build_tree
# balanced?
# print level_order, preorder, postorder, inorder
# add "several numbers >100"
# balanced?
# rebalance
# balanced?
# print level_order, preorder, postorder, inorder

array = [4,8,6,2,1,7,5,3,9]
tree = Tree.new(array)
tree.root = tree.build_tree
p "root: #{tree.root.value}"
p tree.find(8)
# p tree.root.left_child < tree.root
