#=
Given an undirected graph represented as an adjacency matrix and an integer k, write a function to determine whether each vertex in the graph can be colored such that no two adjacent vertices share the same color using at most k colors.
=#

using Test
include("Solutions/problem56_color_graph_k_colors.jl")

graph = [0 1 1 0;1 0 0 0;1 0 0 1;0 0 1 0]

@test colorable(graph, 1) == false
@test colorable(graph, 2)
@test colorable(graph, 3)

graph = [0 1 1 0 1;1 0 0 0 1;1 0 0 1 0;0 0 1 0 1;1 1 0 1 0]

@test colorable(graph, 1) == false
@test colorable(graph, 2) == false
@test colorable(graph, 3)
