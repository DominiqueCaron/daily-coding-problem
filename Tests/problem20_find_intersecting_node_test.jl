#=
Given two singly linked lists that intersect at some point, find the intersecting node. The lists are non-cyclical.

For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return the node with value 8.

In this example, assume nodes with the same value are the exact same node objects.

Do this in O(M + N) time (where M and N are the lengths of the lists) and constant space.
=#

using Test
include("Solutions/problem20_find_intersecting_node.jl")

intersecting_node = Node(8, Node(10, nothing))
A = Node(3, Node(7, intersecting_node))
B = Node(99, Node(1, intersecting_node))

@test findintersect(A, B) == intersecting_node
