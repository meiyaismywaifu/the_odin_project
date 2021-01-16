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
# apparently accessor is sufficient as initialization, if you're ok with 1) nil as default values and 2) not being able to assign at initialization.



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



    # def build_tree(array = @array)
# can't do this with recursion...
# no wait, it should still work, that's just a default value.

    if array.length == 1                        # [criteria]
        return Node.new(array[0])               # [block]
    else
        node = Node.new                         # [recursion]
        middle = array.length/2.floor-1
        node.value = array[middle]
        node.left_child = build_tree(array[0..middle-1])
        node.right_child = build_tree(array[middle+1..-1])

        return node                             # [final answer]
    end
# this infinite loops...
# doesn't work on arrays length <3?
# this didn't appear in merge_sort because i wasn't removing the middle...
# problem at length 2.
    array = [1,2]
    array = array.uniq.sort
    def splitter(array)
        midpoint = (array.length-1)/2.floor
        middle = array[midpoint]
        left = array[0..midpoint-1]
        right = array[midpoint+1..-1]
        p "array = #{array}"
        p "length = #{array.length}"
        p "midpoint = #{midpoint}"
        p "middle: #{middle}"
        p "left: #{left}"
        p "right: #{right}"
    end
    splitter(array)
# returns:
    "array = [1, 2]"
    "length = 2"
    "midpoint = 0"
    "middle: 1"
    "left: [1, 2]"
    "right: [2]"
# the definitions of left and right.. 0 becomes -1. which points to the end.
# it so happens my usage only triggers problems when it's length 2.
# what would be an elegant solution?
# teshigahara's is elegant. it also uses nils as end cases? hm.
# think its more explicit if i just make odd and even cases, or just a case for array length 2. computer/language should work for me, not me for it. this is also a kind of elegance.
    if array.length == 1                        # [criteria]
        return Node.new(array[0])               # [block]
    else
        node = Node.new
        
        unless array.length == 2                # [recursion]
            middle = (array.length-1)/2.floor
            node.value = array[middle]
            node.left_child = build_tree(array[0..middle-1])
            node.right_child = build_tree(array[middle+1..-1])
        else                                    # [secondary block]
            node.value = array[0]
            node.right_child = array[1]
        end

        return node                             # [final answer]
    end
# is this two end cases then? is that allowed?
# why wouldn't it be allowed? because it'd be difficult to read. but compared to what?
        middle = (array.length-1)/2.floor
        left = array.length == 2 ? 0 : middle - 1
        right = middle+1
# something like this. but it'd require a different end case, like a nil; this returns 7,8 as 7 root 7 left 8 right. i don't like the concept of nil end though; trees end with nodes, not values. so we'll go with 2 end cases.
    if array.length == 1                        # [criteria]
        return Node.new(array[0])               # [main block]
    elsif array.length == 2
        return Node.new(array[0],nil,array[1])  # [secondary block]
    else
        node = Node.new
        middle = (array.length-1)/2.floor   # [recursion]
        node.value = array[middle]
        node.left_child = build_tree(array[0..middle-1])
        node.right_child = build_tree(array[middle+1..-1])
        
        @root = node
        return node                             # [final answer]
    end
# better...
    return Node.new(array[0]) if array.length == 1 # [blocks]
    return Node.new(array[0],nil,array[1]) if array.length == 2

    node = Node.new
    middle = (array.length-1)/2.floor   # [recursion]
    node.value = array[middle]
    node.left_child = build_tree(array[0..middle-1])
    node.right_child = build_tree(array[middle+1..-1])

    @root = node
    return node                             # [final answer]
# better...
# hm, lengths of words are important.
# this length-2 case isn't giving a node to the final one, that's no good.
    node = Node.new
    case array.length
    when 1
        node.value = array[0]
        return node
    when 2
        node.value = array[0]
        node.right_child = build_tree(array[1..1])
        return node
    else
        middle = (array.length-1)/2.floor   # [recursion]
        node.value = array[middle]
        node.left_child = build_tree(array[0..middle-1])
        node.right_child = build_tree(array[middle+1..-1])
        @root = node
        return node
    end
# this looks worse. also doesn't assign root if it's under 3.
# wait, none of these assign root under 3.
# would need to assign root for every if/case...
# ...meaning it's simpler outside the recursion.



# could do the object_id thing from linked_list.
# +: readable
# -: it's supposed to be a tree
# well, we'll see what the rest of this wants; we know how to add it already.