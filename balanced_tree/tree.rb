class Tree
    attr_accessor :root # root is the root node, which is also the whole tree. needs to be manually assigned outside.

    # given. modified naming.
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
      end

    def initialize(array)
        @array = prepare(array)
        @known = "N/A"
        @known_prev = "N/A"
    end

    def prepare(array = @array)
        return array.uniq.sort
    end

    # recursively builds tree
    # returns root node, which contains entire tree
    def build_tree(array = @array)
        return Node.new(array[0]) if array.length == 1  # [two blocks]
        return Node.new(array[0],nil,Node.new(array[1])) if array.length == 2

        node = Node.new
        middle = (array.length-1)/2.floor               # [recursion]
        node.value = array[middle]
        node.left_child = build_tree(array[0..middle-1])
        node.right_child = build_tree(array[middle+1..-1])
        return node                                     # [final answer]
    end
    
    # this name is full of shit. it's add(value).
    # it's only here because that's the project spec.
    # returns console message.
    def insert(value)
        check = find(value)

        unless check.is_a? Node
            @known = @known_prev if @known.nil?

            if @known > value
                @known.left_child = Node.new(value)
                p "#{value} now left_child of #{@known.value}."
            elsif @known < value
                @known.right_child = Node.new(value)
                p "#{value} now right_child of #{@known.value}."
           end 
        else
            p "#{value} exists at #{check}."
        end
        @known = "N/A"; @known_prev = "N/A"
    end
    
    # the definition of "delete" is also spurious.
    # returns console message.
    def delete(value)
        check = find(value)
        
        unless check.is_a? String
            # no children : remove self from parent
            if @known.left_child.nil? && @known.right_child.nil?
                relation = find_parent(@known)
                if relation["position"] == "left"
                    relation["parent"].left_child = nil
                elsif relation["position"] == "right"
                    relation["parent"].right_child = nil
                end

            # one child : replace self in parent with child
            elsif @known.left_child.nil? || @known.right_child.nil?
                relation = find_parent(@known)
                child = @known.left_child || @known.right_child
                # assigns whichever is (not nil) first, seems.
                if relation["position"] == "left"
                    relation["parent"].left_child = child
                elsif relation["position"] == "right"
                    relation["parent"].right_child = child
                end

            # two children: replace self with next inorder
            else
                replace = @known
                
                array = inorder
                successor_value = array[array.index(value)+1]
                successor = find(successor_value)
                delete(successor) # successor sees self as child otherwise

                replace.value = successor.value
                successor.left_child = replace.left_child
                successor.right_child = replace.right_child
            end

            p "#{value} deleted."
        else
            p "#{value} does not exist in this tree."
        end
    end

    # finds node with given value. also accepts nodes.
    # returns node or error(string)
    def find(value)
        @known = @root
        hit = false; result = "#{value} not found"
        until hit == true
            if @known == value
                result = @known; hit = true

            elsif @known.nil? || @known.is_leaf?
                hit = true
            elsif @known > value # [value < @known] doesn't work
                @known_prev = @known
                @known = @known.left_child
            elsif @known < value
                @known_prev= @known
                @known = @known.right_child
            end
        end
        return result
    end

    # ~identical to [find] except for the hit conditions. see [471, 586].
    # returns node or error
    def find_parent(value)
        parent = @root
        hit = false, result = "parent searching error"
        until hit == true
            if parent.left_child == value ###
                result = {"parent" => parent, "position" => "left"} ###
                hit = true
            elsif parent.right_child == value ###
                result = {"parent" => parent, "position" => "right"} ###
                hit = true

            elsif parent.is_leaf? ###
                hit = true
            elsif parent > value
                parent = parent.left_child
            elsif parent < value
                parent = parent.right_child
            end
        end
        return result
    end

    # breadth-first level order
    # returns array
    def level_order(node = @root)
        result = []
        queue = []
        queue << node

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

    # longest distance to leaf. accepts value or node.
    # returns integer
    def height(value)
        start = (value.is_a? Integer) ? find(value) : value
        result = []
        queue = []; queue << start
        level = []; counter = 0

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

        height = result.max

        return height
    end

    # distance to root. accepts value or node.
    # identical to [find] except for a counter
    # returns integer. root = depth 0.
    def depth(value)
        @known = @root
        hit = false
        count = 0; ###
        until hit == true
            if @known == value
                hit = true

            elsif @known.is_leaf?
                hit = true
            elsif @known.nil?
                count = "error: #{value} not found."
                break

            elsif @known > value
                count += 1 ###
                @known = @known.left_child
            elsif @known < value
                count += 1 ###
                @known = @known.right_child
            end
        end
        return count ###
    end

    # difference of left and right heights is not more than 1
    # returns boolean
    def balanced?
        left_height = height(@root.left_child)
        right_height = height(@root.right_child)
        return (left_height - right_height).abs <= 1
    end

    # rebalances tree
    # returns [build_tree], must be assigned to @root.
    def rebalance
        array = level_order
        @array = prepare(array)
        return build_tree
    end
end