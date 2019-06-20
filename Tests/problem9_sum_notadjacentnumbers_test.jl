#=
Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be 0 or negative.

For example, [2, 4, 6, 2, 5] should return 13, since we pick 2, 6, and 5. [5, 1, 1, 5] should return 10, since we pick 5 and 5.

Follow-up: Can you do this in O(N) time and constant space?
=#

using Test
include("Solutions/problem9_sum_notadjacentnumbers.jl")
@test sum_notadjacent([2, 4, 6, 2, 5]) == 13
@test sum_notadjacent([5, 1, 1, 5]) == 10
@test sum_notadjacent([-3, -4, -7, 1, 0, 1]) == 2
