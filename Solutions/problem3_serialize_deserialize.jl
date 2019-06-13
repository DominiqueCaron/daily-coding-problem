#=
Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.

For example, given the following Node class

class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

The following test should pass:

node = Node('root', Node('left', Node('left.left')), Node('right'))
assert deserialize(serialize(node)).left.left.val == 'left.left'
=#

function serialize(root)
    type = typeof(root)
    names = fieldnames(type)
    out = Array{Any}(undef, length(names)+1)
    out[1] = type
    for i in 1:length(names)
        out[i+1] = getfield(root, names[i])
    end
    return out
end

function deserialize(s)
    type = s[1]
    fields = s[2:end]
    if length(fields) == 1
        out = type(fields[1])
    end
    if length(fields) == 2
        out = type(fields[1],fields[2])
    end
    if length(fields) == 3
        out = type(fields[1],fields[2], fields[3])
    end
    if length(fields) == 4
        out = type(fields[1],fields[2], fields[3], fields[4])
    end
    if length(fields) == 5
        out = type(fields[1],fields[2], fields[3], fields[4], fields[5])
    end
    return out
end
