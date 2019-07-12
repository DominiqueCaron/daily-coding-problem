#=
The edit distance between two strings refers to the minimum number of character insertions, deletions, and substitutions required to change one string to the other. For example, the edit distance between “kitten” and “sitting” is three: substitute the “k” for “s”, substitute the “e” for “i”, and append a “g”.

Given two strings, compute the edit distance between them.
=#

function editdistance(string1::String, string2::String)
    if length(string1) <= length(string2)
        string_to_change = string1
        final_string = string2
    else
        string_to_change = string2
        final_string = string1
    end
    edit_distance = 0
    char_index = 1
    while string_to_change != final_string
        if char_index > length(string_to_change)
            string_to_change = string_to_change * final_string[char_index:char_index]
            edit_distance = edit_distance + 1
        elseif string_to_change[char_index] != final_string[char_index]
            string_to_change = final_string[1:char_index] * string_to_change[char_index+1:end]
            edit_distance = edit_distance + 1
        end
        char_index = char_index + 1
    end
    return edit_distance
end
