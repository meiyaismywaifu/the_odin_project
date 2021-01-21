class Tree
    attr_accessor :root # root is the root node, which is also the whole tree

    def initialize(array)
        @array = prepare(array)
        @found = false
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

    # this is "traverse until found"
    # since it's a tree of numbers, can just compare.
    def find(value, node = @root)
        # return node with given value
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

    # breadth-first level order
    def level_order
        result = []
        queue = []
        queue << @root

        until queue.empty?
            node = queue.shift
            result << node.value
            queue << node.left_child << node.right_child
            queue.compact!
        end

        return result
    end

    # depth-first types
    def inorder
        #return array of values
    end
    def preorder
        #return array of values
    end
    def postorder
        #return array of values
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