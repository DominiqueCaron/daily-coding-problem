#=
Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be 0 or negative.

For example, [2, 4, 6, 2, 5] should return 13, since we pick 2, 6, and 5. [5, 1, 1, 5] should return 10, since we pick 5 and 5.

Follow-up: Can you do this in O(N) time and constant space?
=#

function sum_notadjacent(X::Array{Int, 1})
    sum = zeros(Int8, length(X))
    sum[1] = maximum([X[1], 0])
    if length(X) >= 2
        sum[2] = maximum([sum[1], X[2]])
    end
    if length(X) >= 3
        for index in 3:length(X)
            sum[index] = maximum([sum[index-2] + X[index], sum[index-1]])
        end
    end
    return sum[end]
end
