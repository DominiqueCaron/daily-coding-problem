#=
Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

For example, given the array [34, -50, 42, 14, -5, 86], the maximum sum would be 137, since we would take elements 42, 14, -5, and 86.

Given the array [-5, -1, -8, -9], the maximum sum would be 0, since we would not take any elements.

Do this in O(N) time.
=#

function maximum_contiguous_sum(X::Array{Int,1})
    max_sum = 0
    current_subarray = []
    current_sum = 0
    for index in eachindex(X)
        if current_sum + X[index] > 0
            push!(current_subarray, X[index])
            current_sum = current_sum + X[index]
            if current_sum > max_sum
                max_sum = current_sum
            end
        else
            current_sum = 0
            current_subarray = []
        end
    end
    return max_sum
end
