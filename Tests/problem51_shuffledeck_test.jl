#=
Given a function that generates perfectly random numbers between 1 and k (inclusive), where k is an input, write a function that shuffles a deck of cards represented as an array using only swaps.

It should run in O(N) time.

Hint: Make sure each one of the 52! permutations of the deck is equally likely.
=#

using Test
include("Solutions/problem51_shuffledeck.jl")

@test sort(shuffle(collect(1:52))) == collect(1:52)
