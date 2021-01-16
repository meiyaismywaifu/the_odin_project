class Node
    # include Comparable
    attr_accessor :value, :left_child, :right_child

    # below unnecessary if
    # 1) nil as default values, and
    # 2) no ability to assign at initialization
    def initialize(value = "error", left_child = nil, right_child = nil)
        @value = value
        @left_child = left_child
        @right_child = right_child
    end

    # "As a bonus, try including the Comparable module and compare nodes using their data attribute."
        # this appears in the documentation, calling it doesn't give error.
        # attribute = instance variable.. this module adds one of these...

end