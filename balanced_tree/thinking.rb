# forgot to sync so this is round 2.
# as far as i understand, this is linked lists 1.8.

# --- --- ---
# 1. Build a Node class. It should have an attribute for the data it stores as well as its left and right children. As a bonus, try including the Comparable module and compare nodes using their data attribute.
# 2. Build a Tree class which accepts an array when initialized. The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
# 3. Write a #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!). The #build_tree method should return the level-1 root node.
# 4. Write an #insert and #delete method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not). If you need additional resources, check out these two articles on inserting and deleting, or this video with several visual examples.
# 5. Write a #find method which accepts a value and returns the node with the given value.
# 6. Write a #level_order method that returns an array of values. This method should traverse the tree in breadth-first level order. This method can be implemented using either iteration or recursion (try implementing both!). Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the video).
# 7. Write #inorder, #preorder, and #postorder methods that returns an array of values. Each method should traverse the tree in their respective depth-first order.
# 8. Write a #height method which accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.
# 9. Write a #depth method which accepts a node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.
# 10. Write a #balanced? method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.
# 11. Write a #rebalance method which rebalances an unbalanced tree. Tip: You’ll want to create a level-order array of the tree before passing the array back into the #build_tree method.
# 12.  Write a simple driver script that does the following:
#   1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
#   2. Confirm that the tree is balanced by calling `#balanced?`
#   3. Print out all elements in level, pre, post, and in order
#   4. try to unbalance the tree by adding several numbers > 100
#   5. Confirm that the tree is unbalanced by calling `#balanced?`
#   6. Balance the tree by calling `#rebalance`
#   7. Confirm that the tree is balanced by calling `#balanced?`
#   8. Print out all elements in level, pre, post, and in order
# --- --- --- --- --- ---

    class Node
        attr_accessor :value, :left_children, :right_children
        def assign
            @value = "assigned"
        end
    end
    node = Node.new
    node.value = 5; #p node.value
    node.assign; #p node.value
# apparently accessor is sufficient as initialization, if you're ok with nil as default values.

# (2) is unclear. gonna assume it wants build_tree to return root.
# oh there it is in (3). ok. why's it called level-1 root? shouldn't it be level-0?

# recursion midpoint/lower-mid...
# 1 2 3 4 5 6 7 8 9
#        4
#      /- -\
#     2     7
#    / \   / \
#   1   3 5   8
#          \   \
#           6   9

# can't remember how to think about recursion.
# end case first right? what's the end case for this?

# merge sort was similar right?
# merge_sort:
#    if array length < 2
#       return array
#    else
#       merge_sort middle, left, right
#       ---
#       until left and right are empty
#           compare left vs right, place in order
#       end
#       return final answer
#    end
# hmmm.... 

# method:
#   if [basic block criteria]
#       return [basic block]
#   else
#       [recursion call]
#       ---
#       execute
#       return [final]
#   end
# ...do i need recursion? well, the article it points to uses it.

# build_tree(array)... block would be array length == 1?
#   if array length == 1                    [criteria]
#       return new node of this value       [block]
#   else
#       new node:                           [recursion]
#       value = middle
#       left_child = build_tree(<middle)
#       right_child = build_tree(>middle)
#       return node                         [final answer]
#   end
# ...where's the [execute]?
# what does this output? i don't like recursion. /recursion/thinking.rb [50-54] sure helps a lot though.


    class Test
        attr_accessor :character
        def initialize(string)
            @character = mod(string)
        end
        def mod(string)
            return string.upcase
        end
    end
    test = Test.new("a")
    # p test.character
# what was i looking for again? oh right, checking if syntax worked the way i remembered it, and inside initialize. i don't remember syntax...