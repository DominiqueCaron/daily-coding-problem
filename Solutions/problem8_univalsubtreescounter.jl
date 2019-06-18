#=
A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.

Given the root to a binary tree, count the number of unival subtrees.

For example, the following tree has 5 unival subtrees:

   0
  / \
 1   0
    / \
   1   0
  / \
 1   1
=#

# Create a binary tree structure
struct Node
    key::Int
    left::Union{Node, Nothing}
    right::Union{Node, Nothing}
end

function Node(key::Int; left = nothing, right = nothing)
    Node(key, left, right)
end

function isunival(node::Node)
    if isnothing(node.left) && isnothing(node.right)
        return true
    elseif node.left == node.right
        return true
    else
        return false
    end
end

function count_unival_subtrees(node::Node)
    if isunival(node)
        N = 1
    else
        N = 0
    end
    if !isnothing(node.left)
        N = N + count_unival_subtrees(node.left)
    end
    if !isnothing(node.right)
        N = N + count_unival_subtrees(node.right)
    end
    return N
end
