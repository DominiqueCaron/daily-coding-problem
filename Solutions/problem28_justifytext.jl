#=
Write an algorithm to justify text. Given a sequence of words and an integer line length k, return a list of strings which represents each line, fully justified.

More specifically, you should have as many words as possible in each line. There should be at least one space between each word. Pad extra spaces when necessary so that each line has exactly length k. Spaces should be distributed as equally as possible, with the extra spaces, if any, distributed starting from the left.

If you can only fit one word on a line, then you should pad the right-hand side with spaces.

Each word is guaranteed not to be longer than k.

For example, given the list of words ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"] and k = 16, you should return the following:

["the  quick brown", # 1 extra space on the left
"fox  jumps  over", # 2 extra spaces distributed evenly
"the   lazy   dog"] # 4 extra spaces distributed evenly
=#

function justify(text::Array{String,1}, k)
    justified_text = [""]
    for word in text
        justified_text[end], istoolong = addword(justified_text[end], word, k)
        if istoolong
            justified_text[end] = justify(justified_text[end], k)
            push!(justified_text, word)
        end
    end
    justified_text[end] = justify(justified_text[end], k)
    return justified_text
end

function justify(sentence::String, k)
    spaces_to_add = k - length(sentence)
    spaces_in_sentence = findall(isequal(' '), sentence)
    space_pos = spaces_in_sentence[1] - 2
    justified_sentence = sentence
    char_to_skip = 2
    if spaces_in_sentence == 0
        justified_sentence = sentence * repeat(" ", spaces_to_add)
    else
        while spaces_to_add != 0
            space_pos = findnext(isequal(' '), justified_sentence, space_pos + char_to_skip)
            if isnothing(space_pos)
                space_pos = findfirst(isequal(' '), justified_sentence)
                char_to_skip = char_to_skip + 1
            end
            justified_sentence = justified_sentence[1:space_pos] * " " * justified_sentence[space_pos + 1:end]
            spaces_to_add = spaces_to_add - 1
        end
    end
    return justified_sentence
end

function addword(sentence, word, k)
    if sentence == ""
        new_sentence = word
        istoolong = false
    elseif length(sentence) + 1 + length(word) <= k
        new_sentence = sentence * " " * word
        istoolong = false
    else
        new_sentence = sentence
        istoolong = true
    end
    return new_sentence, istoolong
end
