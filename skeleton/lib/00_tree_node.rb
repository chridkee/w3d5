class PolyTreeNode
    attr_reader :value, :children, :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end
    #             #node1
    #             #node2.parent
#     def parent=(parent_node)
#         if parent_node == nil
#             @parent = nil 
#         else
#             #true or false 
#             unique = parent_node.children.all? {|el| el.value != self.value}
#                     #node1.chidren [node2, node3].all?
#             if unique                   #node1
#                 parent_node.children << self 
#             end
#             @parent = parent_node
#         end
#     end
# end
    def parent=(parent_node)
        
        @parent.children.delete(self) if self.parent != nil # remove from parent's children array
           
        if parent_node == nil 
            @parent = nil # set parent to nil
        else
        unique = parent_node.children.all? {|el| el.value != self.value}
            if unique 
                parent_node.children << self 
            end
            @parent = parent_node
        end 
    end
      
    def inspect 
        @value.inspect 
    end 

    def add_child(child_node)
        child_node.parent = self
    end 

    def remove_child(child_node)
        child_node.parent = nil 
        child_node.parent.children.delete(child_node)
    end
    
    #DFS

    require "byebug"

    def dfs(target)
        debugger
        stack = []
        stack << self
        #return self if stack.first.value == target

        node = stack.pop
        return node if node.value == target

        node.children.each do |child|
            stack << child
            result = child.dfs(target)
            return child if result != nil
            stack.pop(target)
        end
        nil
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


        