#=
You run an e-commerce website and want to record the last N order ids in a log. Implement a data structure to accomplish this, with the following API:

    record(order_id): adds the order_id to the log
    get_last(i): gets the ith last element from the log. i is guaranteed to be smaller than or equal to N.

You should be as efficient with time and space as possible.
=#

using Test
include("Solutions/problem16_log_orderID.jl")

for i in 1:10
    record(i)
end

@test length(log) == N
@test get_last(2) == 9
