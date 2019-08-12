#=
Given a multiset of integers, return whether it can be partitioned into two subsets whose sums are the same.

For example, given the multiset {15, 5, 20, 10, 35, 15, 10}, it would return true, since we can split it up into {15, 5, 10, 15, 10} and {20, 35}, which both add up to 55.

Given the multiset {15, 5, 20, 10, 35}, it would return false, since we can't split it up into two subsets that add up to the same sum.
=#

function ispartitionable(multiset::Array{Int,1})
    sorted_multiset = sort(multiset, rev = true)
    left_subset = sorted_multiset[1:1]
    right_subset = sorted_multiset[2:end]
    index = 1
    while sum(left_subset) < sum(right_subset) && index < length(right_subset)
        if sum(left_subset) + right_subset[index] <= sum(right_subset) - right_subset[index]
            push!(left_subset, popfirst!(right_subset))
            index = 1
        else
            index = index + 1
        end
    end

    if sum(left_subset) == sum(right_subset)
        return true
    else
        return false
    end
end
