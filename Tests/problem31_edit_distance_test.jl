#=
The edit distance between two strings refers to the minimum number of character insertions, deletions, and substitutions required to change one string to the other. For example, the edit distance between “kitten” and “sitting” is three: substitute the “k” for “s”, substitute the “e” for “i”, and append a “g”.

Given two strings, compute the edit distance between them.
=#

using Test
include("Solutions/problem31_edit_distance.jl")

@test editdistance("kitten", "sitting") == 3
@test editdistance("cat", "dog") == 3
