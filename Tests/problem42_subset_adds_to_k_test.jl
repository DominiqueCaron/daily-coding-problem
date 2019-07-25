#=
Given a list of integers S and a target number k, write a function that returns a subset of S that adds up to k. If such a subset cannot be made, then return null.

Integers can appear more than once in the list. You may assume all numbers in the list are positive.

For example, given S = [12, 1, 61, 5, 9, 2] and k = 24, return [12, 9, 2, 1] since it sums up to 24.
=#

using Test
include("Solutions/problem42_subset_adds_to_k.jl")

@test subarraywithsum([12, 1, 61, 5, 9, 2], 24) == [12, 9, 2, 1]
@test subarraywithsum([12, 1, 61, 5, 9, 2], 19) == [12, 5, 2]
@test isnothing(subarraywithsum([12, 1, 61, 5, 9, 2], 40))
