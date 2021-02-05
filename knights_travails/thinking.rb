# Its basic move is two steps forward and one step to the side. It can face any direction.
#
# Your task is to build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.
#
# Put together a script that creates a game board and a knight.
# Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
# Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
# Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:
#   > knight_moves([3,3],[4,3])
#   => You made it in 3 moves!  Here's your path:
#     [3,3]
#     [4,5]
#     [2,4]
#     [4,3]
# --- --- --- --- --- ---

# what does this have to do with BFS and DFS?
# "treat all possible moves as children in a tree"...
# "expand tree until solution is found, then return path with minimum height"? wouldn't the clause itself prevent the tree from expanding? not if it's recursion, recursion would search until the end for every path. wouldn't that be wasteful? can we do this without recursion? i don't think so. can we stop recursion with an attribute? maybe...
# ...? can we build a tree by level-order?
# position, check, add all children to queue, add counter, move to next in queue, etc. same as... height from /balanced_tree. which is what we'd expect. ok, let's try doing that.

# all paths are arrays of arrays. if there's only one then it's easy. if we only return one then it's easy. if there's multiple and we want to return multiple it becomes more difficult. well, more important to have an idea how it'd be implemented than actually implementing it. "this spot is reachable in N moves via B paths, this is one of them", perhaps.



# array mod test
    p [2,2] + [-1,-1]
    a = [2,2]
    b = [-1,-1]
    c = [a[0]+b[0],a[1]+b[1]]
    p c



# oh wait i'm forgetting the "children in a tree" part. hmmmm.
# hmmmmmmmmmmmmmmmmmmmmmmmmm
# can i build a tree non-recursively? i should, right?

# do i need to search for node each time to add children to it?
# what if the queue itself was for nodes?

# that builds the tree. how to return a path?..
# do i need to [find_parent] on each step?
# can i add parent as value at creation?
# should use object_ids if dual direction otherwise infinite.
# with this, should just need to keep all final destination nodes in an array, then run parent on one (or each) of them until it hits root, output that to an array, reverse.

# syntax
    array = [1,2,3,4,5,6,7]
    array.each { |x|
        p "hello #{x}"
    }
# b
    array.each do |x|
        p "hello #{x}"
    end

# well that was easy. almost literally everything outside of the above two sytnaxes worked exactly as expected on the first go.