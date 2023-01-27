class PolyTreeNode
    attr_reader :value, :children, :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node)
        # if self.parent != nil
            @parent.children.delete(self) # remove from parent's children array
           
            @parent = nil # set parent to nil
        # else
            unique = parent_node.children.all? {|el| el.value != self.value}
            if unique 
                parent_node.children << self 
            end
            @parent = parent_node
        # end
    end 
      
    def inspect 
        @value.inspect 
    end 
    
end

  # each do |el|
        #     if el.value == self.value 
        # end 
        # if !@children.include?(self)
        #     parent.children << self
        # end

        # a self: children: [], parent: b
        # b parent: children[a], parent