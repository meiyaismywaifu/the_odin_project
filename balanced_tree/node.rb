class Node
    attr_accessor :value, :left_child, :right_child

    # below unnecessary if
    # 1) nil as default values, and
    # 2) no ability to assign at initialization
    def initialize(value = "error", left_child = nil, right_child = nil)
        @value = value
        @left_child = left_child
        @right_child = right_child
    end

    def is_leaf?
        return left_child.nil? && right_child.nil?
    end

    include Comparable
    def <=>(other)
        if other.is_a? Node
            value <=> other.value
        elsif other.is_a? Integer
            value <=> other
        else
            p "Node does not know how to compare to this: #{other}"
        end
    end
end