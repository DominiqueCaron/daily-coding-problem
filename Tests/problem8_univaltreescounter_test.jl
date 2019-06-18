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

using Test
include("Solutions/problem8_univalsubtreescounter.jl")

# The example
#=
    0
   / \
  1   0
     / \
    1   0
   / \
  1   1
=#

node = Node(1, Node(1),Node(1))
node = Node(0, node, Node(0))
node = Node(0, Node(1), node)

@test count_unival_subtrees(node) == 5

# Other example
#=      0
      /  \
     0   1
    / \
   1  1
  /\  /\
 1 1 1 1
 =#

node = Node(1, Node(1), Node(1))
node = Node(0, node, node)
node = Node(0, node, Node(1))

@test count_unival_subtrees(node) == 8
