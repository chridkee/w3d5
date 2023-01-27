class PolyTreeNode
    
    attr_reader :value, :children, :parent 
    
    def initialize(value) 
        @value = value 
        @parent = nil 
        @children = []
    end 

    def parent=(parent)
        @parent = parent
        if !parent.children.include?(self) && self != nil && parent != nil
            parent.children << self   
        end
    end 

end