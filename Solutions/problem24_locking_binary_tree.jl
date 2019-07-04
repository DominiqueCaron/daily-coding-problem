#=
Implement locking in a binary tree. A binary tree node can be locked or unlocked only if all of its descendants or ancestors are not locked.

Design a binary tree node class with the following methods:

    is_locked, which returns whether the node is locked
    lock, which attempts to lock the node. If it cannot be locked, then it should return false. Otherwise, it should lock it and return true.
    unlock, which unlocks the node. If it cannot be unlocked, then it should return false. Otherwise, it should unlock it and return true.

You may augment the node to add parent pointers or any other property you would like. You may assume the class is used in a single-threaded program, so there is no need for actual locks or mutexes. Each method should run in O(h), where h is the height of the tree.
=#

mutable struct Node
    key::Int
    left::Union{Node, Nothing}
    right::Union{Node, Nothing}
    locked::Bool
end

function is_locked(node::Node)
    return node.locked
end

function is_lockable(node::Node)
    if isnothing(node.right) && isnothing(node.left)
        return true
    elseif isnothing(node.right) && is_locked(node.left)
        return is_lockable(node.left)
    elseif is_locked(node.right) && isnothing(node.left)
        return is_lockable(node.right)
    elseif is_locked(node.right) && is_locked(node.left)
        return is_lockable(node.right) && is_lockable(node.left)
    else
        return false
    end
end

function lock(node::Node)
    if is_lockable(node)
        setfield!(node, :locked, true)
        return true
    else
        return is_lockable(node)
    end
end

# for the unlock function, I need a way to lock for the ancestors....
