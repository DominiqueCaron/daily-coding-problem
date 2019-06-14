#=
Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.

For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.
=#

using Test
include("Solutions/problem4_lowestmissing.jl")
@test lowestmissing([3, 4, -1, 1]) == 2
@test lowestmissing([1, 2, 0]) == 3
