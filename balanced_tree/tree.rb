class Tree
    attr_accessor :root

    def initialize(array)
        @array = prepare(array)
    end

    # instructions said to make build_tree do this,
    # but since it's recursion it seemed wasteful.
    def prepare(array = @array)
        return array.uniq.sort
    end

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
    
    def insert(value)
        # if value exists, error
        # otherwise, new node? how much reorganizing is this?
    end
    def delete(value)
        # "you’ll have to deal with several cases for delete such as when a node has children or not"
    end

    def find(value)
        # return node with given value
    end

    def level_order
        # breadth-first level order
            # This method can be implemented using either iteration or recursion (try implementing both!).
            # Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the video).
        # return array
    end

    # depth-first types
    def inorder
        #return array
    end
    def preorder
        #return array
    end
    def postorder
        #return array
    end

    def height
        # longest distance to leaf
    end

    def depth
        # distance to root
    end

    def balanced?
        # difference of left and right heights is not more than 1
    end

    def rebalance
        # tree to array
        # build_tree(array)
        # no return?

        # "Tip: You’ll want to create a level-order array of the tree before passing the array back into the #build_tree method."
            # wouldn't i want an in-order?
    end
end