#=
Given an integer k and a string s, find the length of the longest substring that contains at most k distinct characters.

For example, given s = "abcba" and k = 2, the longest substring with k distinct characters is "bcb".
=#

function find_longest_substring(k::Int64, s::String)
    longest_substring = ""
    for char_index in 1:length(s)
        substring, length_substring = find_substring(k::Int64, s[char_index:end])
        if length_substring >= length(longest_substring)
            longest_substring = substring
        end
    end
    return longest_substring, length(longest_substring)
end

function find_substring(k::Int64, s::String)
    index = 1
    substring = ""
    allowed_char = [s[1]]
    while length(allowed_char) <= k && index < length(s)
        substring = substring * s[index:index]
        index = index + 1
        allowed_char = unique(append!(allowed_char, s[index]))
    end
    return substring, length(substring)
end
