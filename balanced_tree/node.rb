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
end