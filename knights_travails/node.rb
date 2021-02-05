class Node
    attr_accessor :position, :parent, :children

    # below unnecessary if
    # 1) nil as default values, and
    # 2) no ability to assign at initialization
    def initialize(position, parent = "unassigned", children = [])
        @position = position
        @parent = parent
        @children = children
    end
end