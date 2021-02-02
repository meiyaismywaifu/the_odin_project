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



# Stop wasting your time on recursion kek

# that's what the next thing in the list was

# It's ltiearlly causing a shitstorm at my job because some guy wanted recursion on our project

# i don't think i ever want recursion

# Fixing and adding anything to a recursive function is a pain in the ass

# it serves a purpose but i don't like it
# it's like the opposite of good code
# good code should be explicit structure that is self explanatory

# If you want to add recursion it better be the final version that section of code

# recursion is literally trying to hide as much structure as you can jack yourself off to find

# Recursion was probably good in the era of NASA space "gotta save every byte" era
# Now-a-days code should be self documenting like you said.



# could do the object_id thing from linked_list.
# +: readable
# -: it's supposed to be a tree
# well, we'll see what the rest of this wants; we know how to add it already.

# after [find](below), think i'll keep it without object_id.



# def find(value)
    # return node with given value

    # node = @root
    # until found or read through all nodes
        # if node.value = request, return node
        # else traverse?
            # it'd have to be recursive travel right?
            # how would you stop recursive travel after the solution has been found? instance var? it's outside information.
            # teshigahara doesn't appear to stop it. oh he just has it in place of level_order, apparently. that makes some sense. except level_order should return array of values.
            # both of these are recursive travel, one of these stops at first true result and returns node, other doesn't stop and returns values...
    # end
    # return value not found
# end

# hm?
    @found = false
    def find(value, node = @root)
        return nil if @found == true
        return @found = true; node if node.value == value

        # recursion
    end
# does this work?
    @result = false
    @second = nil
    def tester
        return p "true" if @result == true
        return p "false", @second = "notnil" if @result == false
    end
    tester
    p @second
# ; ignores second command.
# , returns both commands. so looks like it can't be that compact.

# wait, when would i assign @found's value then?
# instance initialization and... end of method? but the end of the method gets called multiple times.
# oh, solved it. that was unexpectedly simple

    def find(value, node = root)
        node = traverse_tree(value, node) until traverse_tree(value, node).nil? || node.data == value
        node.data == value ? node : nil
    end
# this guy's solution is really clean. what is this?
    def find(value, node = root)
        until traverse_tree(value, node).nil? || node.data == value
            node = traverse_tree(value, node) 
        end
        node.data == value ? node : nil
    end
# his traverse_tree... has a comparison on value. i see.
# https://github.com/ChargrilledChook/binary-search-tree/blob/master/tree.rb
# i forgot i was dealing with a tree of numbers. oops.

    def find(value, node = @root)
        # end cases: thing itself, found elsewhere, end leaf
        # end leaf trigger built into recursion section.
        if @found == true
            return nil
        elsif node.value == value
            @found = true
            return node
        end

        # recursion: search left and right.
        # end cases pass either [nil] or [node]. pass node if exists.
        # base is uniques array so there won't be two [node]s.
        left_search, right_search = nil, nil
        left_search = find(value, node.left_child) unless node.left_child.nil?
        right_search = find(value, node.right_child) unless node.right_child.nil?

        # re-initialize trigger. this only executes at the end.
        @found = false if node == root

        if    left_search != nil; return left_search
        elsif right_search != nil; return right_search
        else  return nil
        end
    end
# this is functional.
# i thought it was breadth first but apparently it isn't. what is this?
# preorder...?



# wanted to add 9 to array to fit visualization earlier, but gave 5 as middle. [array.length/2.floor-1] was what i wanted, but i switched it because [133]. so it's not fixed?..
# oh, fixed it.
# before:
    def build_tree(array = @array)
        return Node.new(array[0]) if array.length == 1  # [two blocks]
        return Node.new(array[0],nil,Node.new(array[1])) if array.length == 2
        # two blocks because [0..middle-1] on length 2 returns length 2.

        node = Node.new
        middle = (array.length-1)/2.floor               # [recursion]
        node.value = array[middle]
        node.left_child = build_tree(array[0..middle-1])
        node.right_child = build_tree(array[middle+1..-1])
        return node                                     # [final answer]
    end
# after:
    def build_tree(array = @array)
        return Node.new(array[0]) if array.length == 1 # [block]

        node = Node.new                                # [recursion]
        middle = array.length/2.floor-1 # this was changed
        left = (middle == 0 ? 0 : middle-1) # second block moved here

        node.value = array[middle]
        node.left_child = build_tree(array[0..left])
        node.right_child = build_tree(array[middle+1..-1])
        return node                                    # [final answer]
    end
# apparently not good enough to catch it after call if i change the definition of middle?
# now there's other problems...
# oh im retarded, 5 is the middle of 1-9.



# 1 2 3 4 5 6 7 8 9
#        5
#      /- -\
#     2     7
#    / \   / \
#   1   3 6   8
#        \     \
#         4     9



# what is pre/in/post order?
# a matter of [what]'s placement with respect to the recursions?
# i can move my find's end from before to middle but not after without breaking. why?
# ...i'm starting to see why fixing recursive problems is a pain in the ass.



# Node, Comparable module:
    # "As a bonus, try including the Comparable module and compare nodes using their data attribute."
        # this appears in the documentation, calling it doesn't give error.
        # attribute = instance variable.. this module adds one of these...
    # this doesn't work. "undefined method 'value' for nil:NilClass". the example does work. why?
    # oh. it disagrees with something in find.
    # can't find why.
    # i don't feel like fixing this.
# in Node it's
    include Comparable
    def <=>(other)
        value <=> other.value
    end
# and as long as "value" is defined as attr it doesn't itself cause problems.
# plausibly worth using if find is rewritten.



# apparently these depth-firsts work.
    def preorder(node = @root, result = [])
        result << node.value
        preorder(node.left_child, result) unless node.left_child.nil?
        preorder(node.right_child, result) unless node.right_child.nil?
        return result
    end
# i'm not entirely sure how they work.



    case other.is_a?
    when Node
        value <=> other.value
    when Integer
        value <=> other
    else
        puts "Node does not know how to compare to this: #{other}"
    end
# this would be nice. unfortunately, case/when are connected by ==.



# wait, "insert" is full of shit. you're not splicing things into the tree, you're building on top of it.



# forgot to change spacing to 3. oops.
# 4 looks ok? [def ] lines up now but [if ] does not.
# that encourages more methods doesn't it.



# [@near > value] works while [value < @near] doesn't.
# why?
# oh, is it because [@near >] is a method defined in node while [value > @near] looks for the method called [value >]?



# "delete" is not obvious at all. this isn't how trees work!!!



# [find] and [find_parent] are identical except for the hit condition.
# i think ive done something like this before? i passed in an array or hash of arguments. i feel that's less elegant now though.
    # find(5), find_parent(5)
# is more elegant than
    # find(5,node), find(5, parent)
# like if i say find in a tree, obviously i want to find the node, so the default argument sounds stupid. if the second argument is optional well okay, but "find parent 5" is superior to "find 5 parent". if it were possible to have optional arguments before required ones then maybe there'd be a discussion, but there isn't.
# on the other side i don't see code being cleaner. it'd be the same length, unless there's a way to replace that one condition.
# oh. it's "if (node)", "elsif (parent)", then the conditions themselves.
# ...computers really don't think like people.
# wouldn't it be easier if i could just move backwards in a tree rather than run it from the top every time? that'd be an attribute in each node. it'd have to be object_id cause otherwise it'd be recursive data.
# but then i'd have to find out how to put that into each node. which means revisiting recursion, either build_tree or one of the depths. which basically means rewriting recursion.
# optimize for mimimum lines of code, minimum data storage, minimum cycles, or minimum brainpower?
# oh this is what infinifactory was about. i think i went for minimum cycles there.
# this time i think i am going to minimize brainpower.


# i think i like the look from the code side of keeping method results as instance variables, cleaner. but it's probably better to pass hashes cause it's easier to keep track.



    b = tree.find(8)
    a = b.left_child || b.right_child
# this assigns the one that is not nil. why?
    h = {"left" => "left", "right" => "right"}
    a = h["left"] || h["right"]
# assigns whichever is (not nil) condition first, seems.



# delete when there's two children loops on itself. apparently can't just assign new children? why?
# apparently it refers to itself as child. huh. so this needs to call itself.
# good thing this recursion just worked. why? who knows.



# height and depth...
# depth-first traversal that return.. the value of the node, and the distance so it can be compared..

    # no, depth is easier. it seems to be [find] except with a counter and returns that counter.
    # yeah, that's what it was.

# can this be done without recursion?.. would rather do less of it.
# seems like it could be done with level-order..?
# actually wouldn't it be more intuitive with level-order?

# the thing i had in mind:
    def height(value)
        start = find(value)
        reference = level_order(start)

        result = []
        queue = []
        queue << start

        level = []
        counter = 0

        until queue.empty? && level.empty?
            until queue.empty?
                level << queue.shift
            end
            until level.empty?
                result << counter
                node = level.shift
                queue << node.left_child << node.right_child
            end
            counter += 1
            queue.compact!
        end

        max_index = result.find_index(result.max)
        height = reference[max_index]

        return height
    end
# these lines were unnecessary
    reference = level_order(start)
    # [...]
    max_index = result.find_index(result.max)
    height = reference[max_index]
# this was the replacement
    height = result.max
# the whole thing there doesn't work properly, there's some other thing overlooked. but it aims at "finding the value of the node of greatest height from this node". which is not "find the height from this node".



    def terntest(value)
        answer = value.is_a? Integer ? "is integer" : "is not integer"
        return answer
    end
# apparently can't use is_a? in ternary.
# oh fixed it. put it in parantheses. well that was easy.



# rebalance
    # "Tip: You’ll want to create a level-order array of the tree before passing the array back into the #build_tree method."
        # wouldn't i want an in-order?
# yeah i don't see why i wouldn't use in-order.
# well i have a different opinion now, the point is to get it into an array, but i don't see why what array matters, the point is to get an array, and sort it. in-order isn't better either since it only gives what it says it gives if the tree is balanced.
# well, i'll use level-order because it's not recursive.

# hmm? doesn't work.
# [find] is complaining at [insert]:
    # "undefined method `is_leaf?' for nil:NilClass (NoMethodError)"
# only occasionally though.
# rebalance doesn't rebalance. array is prepared. like it's not writing the results...? oh right, i have to set it to equal to root manually cause [build_tree] is recursive.
# right, so final problem is in comparison to null class somewhere.