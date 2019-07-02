#=
Given a dictionary of words and a string made up of those words (no spaces), return the original sentence in a list. If there is more than one possible reconstruction, return any of them. If there is no possible reconstruction, then return null.

For example, given the set of words 'quick', 'brown', 'the', 'fox', and the string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].

Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or ['bedbath', 'and', 'beyond'].
=#

function find_sentence(s::String, dictionary::Array{String, 1})
    sentence = []
    while length(s) != 0
        word = ""
        char_index = 0
        while !(word in dictionary)
            char_index = char_index + 1
            word = word * s[char_index]
        end
        push!(sentence, word)
        s = s[char_index+1:end]
    end
    return sentence
end
