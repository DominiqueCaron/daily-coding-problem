#=
Given a string of round, curly, and square open and closing brackets, return whether the brackets are balanced (well-formed).

For example, given the string "([])[]({})", you should return true.

Given the string "([)]" or "((()", you should return false.
=#

using Test
include("Solutions/problem27_are_brackets_balanced.jl")

@test isbalanced("([])[]({})") == true
@test isbalanced("([)]") == false
@test isbalanced("((()") == false
