#=
Implement an autocomplete system. That is, given a query string s and a set of all possible query strings, return all strings in the set that have s as a prefix.

For example, given the query string de and the set of strings [dog, deer, deal], return [deer, deal].

Hint: Try preprocessing the dictionary into a more efficient data structure to speed up queries.
=#

function autocomplete(string::String, dictionary::Array{String,1})
    string_length = length(string)
    possible_query = dictionary[first.(dictionary, string_length) .== string]
    return possible_query
end
