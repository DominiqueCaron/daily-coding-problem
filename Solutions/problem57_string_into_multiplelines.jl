#=
Given a string s and an integer k, break up the string into multiple lines such that each line has a length of k or less. You must break it up so that words don't break across lines. Each line has to have the maximum possible amount of words. If there's no way to break the text up, then return null.

You can assume that there are no spaces at the ends of the string and that there is exactly one space between each word.

For example, given the string "the quick brown fox jumps over the lazy dog" and k = 10, you should return: ["the quick", "brown fox", "jumps over", "the lazy", "dog"]. No string in the list has a length of more than 10.
=#

function breakstring(s::String, k::Int)
    string_left = s
    lines = []
    while length(string_left) != 0
        if length(string_left) <= k
            line = string_left
            string_left = ""
            push!(lines, line)
        else
            endofline = findprev(" ", string_left, k+1)[1]
            if isnothing(endofline)
                string_left = ""
                lines = nothing
            else
                line = string_left[1:endofline-1]
                string_left = string_left[endofline+1:end]
                push!(lines, line)
            end
        end
    end
    return lines
end
