#=
Given a list of integers S and a target number k, write a function that returns a subset of S that adds up to k. If such a subset cannot be made, then return null.

Integers can appear more than once in the list. You may assume all numbers in the list are positive.

For example, given S = [12, 1, 61, 5, 9, 2] and k = 24, return [12, 9, 2, 1] since it sums up to 24.
=#

function subarraywithsum(S::Array{Int, 1}, k::Int)
    sort!(S)
    subarray = copy(S)
    index = 0
    while sum(subarray) != k && index != length(S)
        if sum(subarray) - S[end-index] >= k
            deleteat!(subarray, findlast(isequal(S[end-index]), subarray))
        end
        index = index + 1
    end
    if sum(subarray) == k
        return sort!(subarray, rev = true)
    else
        return nothing
    end
end
