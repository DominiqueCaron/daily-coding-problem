#=
Given an array of integers where every integer occurs three times except for one integer, which only occurs once, find and return the non-duplicated integer.

For example, given [6, 1, 3, 3, 3, 6, 6], return 1. Given [13, 19, 13, 13], return 19.

Do this in O(N) time and O(1) space.=
=#

function nonduplicated(arr::Array{Int, 1})
    searching_arr = copy(arr)
    non_duplicated_int = nothing
    while isnothing(non_duplicated_int)
        current_int = searching_arr[1]
        if sum(searching_arr .== current_int) == 1
            non_duplicated_int = current_int
        else
            deleteat!(searching_arr, findall(isequal(current_int), searching_arr))
        end
    end
    return non_duplicated_int
end
