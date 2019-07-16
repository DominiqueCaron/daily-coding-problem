#=
Given the root to a binary search tree, find the second largest node in the tree.
=#

struct Node
    key::Int
    left::Union{Node, Nothing}
    right::Union{Node, Nothing}
end

function node_size(node::Node)
    size = 1
    if !isnothing(node.left)
        size = size + node_size(node.left)
    end
    if !isnothing(node.right)
        size = size + node_size(node.right)
    end
    return size
end

function secondlargestnode(node::Node)
    if node_size(node.right) >= node_size(node.left)
        return node.right
    else
        return node.left
    end
end
