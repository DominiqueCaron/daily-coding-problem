#=
Implement locking in a binary tree. A binary tree node can be locked or unlocked only if all of its descendants or ancestors are not locked.

Design a binary tree node class with the following methods:

    is_locked, which returns whether the node is locked
    lock, which attempts to lock the node. If it cannot be locked, then it should return false. Otherwise, it should lock it and return true.
    unlock, which unlocks the node. If it cannot be unlocked, then it should return false. Otherwise, it should unlock it and return true.

You may augment the node to add parent pointers or any other property you would like. You may assume the class is used in a single-threaded program, so there is no need for actual locks or mutexes. Each method should run in O(h), where h is the height of the tree.
=#

using Test
include("Solutions/problem24_locking_binary_tree.jl")

#= binary tree
        0(f)
      /      \
     1(f)    2(t)
    / \      /  \
 3(t) 4(t) 5(t) 6(t)
=#
node3 = Node(3, nothing, nothing, true)
node4 = Node(4, nothing, nothing, true)
node5 = Node(5, nothing, nothing, true)
node2 = Node(2, node3, nothing, true)
node1 = Node(1, node4, node5, false)
node0 = Node(0, node1, node2, false)

@test is_locked(node3) == true
@test is_locked(node1) == false
@test lock(node0) == false
@test lock(node1) == true
@test node1.locked == true
