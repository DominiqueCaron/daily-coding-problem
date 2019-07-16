#=
Given an array of strictly the characters 'R', 'G', and 'B', segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place.

For example, given the array ['G', 'B', 'R', 'R', 'B', 'R', 'G'], it should become ['R', 'R', 'R', 'G', 'G', 'B', 'B'].
=#

function segregate_rgb(s::Array{Char, 1})
    for char_index in eachindex(s)
        if s[char_index] == 'R'
            if !isnothing(findfirst(isequal('G'), s)) && findfirst(isequal('G'), s) < char_index
                s = swap(s, findfirst(isequal('G'), s), char_index)
            end
        elseif s[char_index] == 'G'
            if !isnothing(findlast(isequal('R'), s)) && findlast(isequal('R'), s) > char_index
                s = swap(s, findlast(isequal('R'), s), char_index)
            elseif !isnothing(findfirst(isequal('B'), s)) && findfirst(isequal('B'), s) < char_index
                    s = swap(s, findfirst(isequal('B'), s), char_index)
            end
        elseif s[char_index] == 'B'
            if !isnothing(findlast(isequal('G'), s)) && findlast(isequal('G'), s) > char_index
                s = swap(s, findlast(isequal('G'), s), char_index)
            end
        end
    end
    return s
end

function swap(s::Array{Char, 1}, x::Int, y::Int)
    out_string = copy(s)
    out_string[x] = s[y]
    out_string[y] = s[x]
    return out_string
end
