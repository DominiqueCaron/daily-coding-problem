#=
Given an array of integers and a number k, where 1 <= k <= length of the array, compute the maximum values of each subarray of length k.

For example, given array = [10, 5, 2, 7, 8, 7] and k = 3, we should get: [10, 7, 8, 8], since:

    10 = max(10, 5, 2)
    7 = max(5, 2, 7)
    8 = max(2, 7, 8)
    8 = max(7, 8, 7)

Do this in O(n) time and O(k) space. You can modify the input array in-place and you do not need to store the results. You can simply print them out as you compute them.
=#

function max_in_subarrays(X::Array{Int64,1}, k::Int64; store_results = false)
    if store_results
        maximums = []
    end
    for index in 1:length(X)-k+1
        subarray = X[1:k]
        popfirst!(X)
        if store_results
            append!(maximums, maximum(subarray))
        else
            println(maximum(subarray))
        end
    end
    if store_results
        return maximums
    end
end
