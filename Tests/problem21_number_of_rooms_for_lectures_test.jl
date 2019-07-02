#=
Given an array of time intervals (start, end) for classroom lectures (possibly overlapping), find the minimum number of rooms required.

For example, given [(30, 75), (0, 50), (60, 150)], you should return 2.
=#

using Test
include("Solutions/problem21_number_of_rooms_for_lectures.jl")

@test number_of_rooms_required([(30, 75), (0, 50), (60, 150)]) == 2
