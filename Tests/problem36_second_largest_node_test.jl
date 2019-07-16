#=
Given the root to a binary search tree, find the second largest node in the tree.
=#

using Test
include("Solutions/problem36_second_largest_node.jl")

test_node = Node(9, Node(8, nothing, Node(3, nothing, nothing)), Node(2, nothing, nothing))
#=
                9
             /     \
            8      2
             |
             3
=#
@test secondlargestnode(test_node) == Node(8, nothing, Node(3, nothing, nothing))
