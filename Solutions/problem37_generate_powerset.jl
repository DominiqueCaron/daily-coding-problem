#=
The power set of a set is the set of all its subsets. Write a function that, given a set, generates its power set.

For example, given the set {1, 2, 3}, it should return {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.

You may also use a list or array to represent a set.
=#

function get_powerset(set::Array{Int,1})
    powerset = [[]]
    for number in set
        push!(powerset, [number])
    end
    set_length = 1
    while set_length < length(set)
        newpowerset = copy(powerset)
        for arr_index in eachindex(powerset)
            arr = powerset[arr_index]
            for number in set
                if length(arr) == set_length && !in(number, arr) && number > arr[end]
                    new_array = union(arr, number)
                    push!(newpowerset, new_array)
                end
            end
        end
        powerset = newpowerset
        set_length = set_length + 1
    end
    return powerset
end
