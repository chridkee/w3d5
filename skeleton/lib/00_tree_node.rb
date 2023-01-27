class PolyTreeNode
    attr_reader :value, :children, :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent)
        return parent if parent == nil
        @parent = parent
        if !@children.include?(self)
            parent.children << self
        end
    end
    
end