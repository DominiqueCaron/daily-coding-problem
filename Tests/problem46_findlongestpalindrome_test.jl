#=
Given a string, find the longest palindromic contiguous substring. If there are more than one with the maximum length, return any one.

For example, the longest palindromic substring of "aabcdcb" is "bcdcb". The longest palindromic substring of "bananas" is "anana".
=#

using Test
include("Solutions/problem46_findlongestpalindrome.jl")

@test longestpalindromicsubstring("aabcdcb") == "bcdcb"
@test longestpalindromicsubstring("bananas") == "anana"
