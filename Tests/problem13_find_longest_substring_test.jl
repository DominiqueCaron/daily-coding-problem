#=
Given an integer k and a string s, find the length of the longest substring that contains at most k distinct characters.

For example, given s = "abcba" and k = 2, the longest substring with k distinct characters is "bcb".
=#
using Test
include("Solutions/problem13_find_longest_substring.jl")

@test find_longest_substring(2, "abcba") == ("bcb", 3)
