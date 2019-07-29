#=
Using a function rand5() that returns an integer from 1 to 5 (inclusive) with uniform probability, implement a function rand7() that returns an integer from 1 to 7 (inclusive).
=#

using Test
include("Solutions/problem45_rand7_from_rand5.jl")

@test rand7() in collect(1:7)
