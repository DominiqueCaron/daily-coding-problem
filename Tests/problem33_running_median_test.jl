#=
Compute the running median of a sequence of numbers. That is, given a stream of numbers, print out the median of the list so far on each new element.

Recall that the median of an even-numbered list is the average of the two middle numbers.

For example, given the sequence [2, 1, 5, 7, 2, 0, 5], your algorithm should print out:

2
1.5
2
3.5
2
2
2
=#

using Test
include("Solutions/problem33_running_median.jl")

@test print_running_median([2, 1, 5, 7, 2, 0, 5], store = true) == [2, 1.5, 2, 3.5, 2, 2.0, 2]
