#=

Implement a job scheduler which takes in a function f and an integer n, and calls f after n milliseconds.

=#

using Test
include("Solutions/problem10_jobscheduler.jl")

@test round(Int, @elapsed job_scheduler(job, 10000)) == 10
