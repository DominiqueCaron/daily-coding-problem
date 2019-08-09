#=
An sorted array of integers was rotated an unknown number of times.

Given such an array, find the index of the element in the array in faster than linear time. If the element doesn't exist in the array, return null.

For example, given the array [13, 18, 25, 2, 8, 10] and the element 8, return 4 (the index of 8 in the array).

You can assume all the integers in the array are unique.
=#

function findnextpivot(X::Array{Int, 1})
    i = 1
    while X[i] < X[i+1] && i < length(X)
        i = i+1
    end
    return i
end

function findindex(X::Array{Int, 1}, element::Int)
    i = 1
    while X[i] != element && i < length(X)
        if X[i] > element
            i = findnextpivot(X[i:end]) + 1
        elseif X[i] < element
            i = i + 1
        end
    end
    if i > length(X)
        return nothing
    else
        return i
    end
end
