#=
A builder is looking to build a row of N houses that can be of K different colors. He has a goal of minimizing cost while ensuring that no two neighboring houses are of the same color.

Given an N by K matrix where the nth row and kth column represents the cost to build the nth house with kth color, return the minimum cost which achieves this goal.
=#
using Test
include("Solutions/problem19_minimum_building_cost.jl")

costs = [1 2 3; 2 10 10; 4 5 9; 10 1 10]

@test minimum_building_cost(costs) == 14.0

costs = [4 2 8 4; 1 2 5 0; 10 11 13 4; 1 1 4 9]

@test minimum_building_cost(costs) == 8.0
