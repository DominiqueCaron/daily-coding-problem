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

function print_running_median(arr::Array; store = false)
    if store
        median_arr = []
    end
    for index in 1:length(arr)
        current_arr = sort(arr[1:index])
        if length(current_arr) % 2 == 0
            median = (current_arr[Int8(length(current_arr)/2)] + current_arr[Int8(length(current_arr)/2 + 1)]) / 2
            println(median)
            if store
                push!(median_arr, median)
            end
        else
            median = current_arr[ceil(Int8, length(current_arr)/2)]
            println(median)
            if store
                push!(median_arr, median)
            end
        end
    end
    if store
        return median_arr
    end
end
