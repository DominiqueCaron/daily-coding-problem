#=
Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

For example, given the array [34, -50, 42, 14, -5, 86], the maximum sum would be 137, since we would take elements 42, 14, -5, and 86.

Given the array [-5, -1, -8, -9], the maximum sum would be 0, since we would not take any elements.

Do this in O(N) time.
=#

using Test
include("Solutions/problem49_maximum_sum_contiguous_subarray.jl")

@test maximum_contiguous_sum([34, -50, 42, 14, -5, 86]) == 137
@test maximum_contiguous_sum([-5, -1, -8, -9]) == 0
