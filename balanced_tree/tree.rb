class Tree
    attr_accessor :root # root is the root node, which is also the whole tree

    def initialize(array)
        @array = prepare(array)
        @found = false
        @near = "N/A"
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
    
    # this name is full of shit. it's add(value).
    # it's only here because that's the project spec.
    def insert(value)
        check = find(value)
        unless check.is_a? Node
            if @near > value
                @near.left_child = Node.new(value)
                p "#{value} now left_child of #{@near.value}."
            elsif @near < value
                @near.right_child = Node.new(value)
                p "#{value} now right_child of #{@near.value}."
           end 
        else
            p "#{value} exists at #{check}."
        end
        @near = "N/A"
    end
    def delete(value)
        check = find(value)
        unless check.is_a? String
            # no children : remove from parent
            # one child : replace self in parent with child
            # two children: replace self with next inorder
        else
            p "#{value} does not exist in this tree."
        end
    end

    # finds node with given value
    # this is v2, see thinking[273~327] for original.
    # changed because these nodes are numbers, not arbitrary objects.
    # returns node or error
    def find(value)
        @near = @root
        hit = false; result = "#{value} not found"
        until hit == true
            if @near == value
                result = @near; hit = true
            elsif @near.is_leaf?
                hit = true
            elsif @near > value # [value < @near] doesn't work
                @near = @near.left_child
            elsif @near < value
                @near = @near.right_child
            end
        end
        return result
    end

    # breadth-first level order
    # returns array
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
    # returns array
    def preorder(node = @root, result = [])
        result << node.value ###
        preorder(node.left_child, result) unless node.left_child.nil?
        preorder(node.right_child, result) unless node.right_child.nil?
        return result
    end
    def inorder(node = @root, result = [])
        inorder(node.left_child, result) unless node.left_child.nil?
        result << node.value ###
        inorder(node.right_child, result) unless node.right_child.nil?
        return result
    end
    def postorder(node = @root, result = [])
        postorder(node.left_child, result) unless node.left_child.nil?
        postorder(node.right_child, result) unless node.right_child.nil?
        result << node.value ###
        return result
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