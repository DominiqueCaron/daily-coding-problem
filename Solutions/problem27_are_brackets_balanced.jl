#=
Given a string of round, curly, and square open and closing brackets, return whether the brackets are balanced (well-formed).

For example, given the string "([])[]({})", you should return true.

Given the string "([)]" or "((()", you should return false.
=#

#=
For a string of brackets to be balanced, it needs to have as many opening brackets than closing brackets. Also, inside all these pairs of brackets, it needs to be balanced.
=#
function isbalanced(s::String)
    is_balanced = true
    if s == ""
        is_balanced = true
    else
        char_index = 1
        while is_balanced == true && char_index <= length(s)
            if s[char_index] in ['[', '(', '{']
                closingbracket = closingbrackets(s[char_index])
                closingbracket_index = findnext(isequal(closingbracket), s, char_index)
                if isnothing(closingbracket_index)
                    is_balanced = false
                else
                    is_balanced = isbalanced(s[char_index+1:closingbracket_index-1])
                end
            end
            char_index = char_index + 1
        end
    end
    return is_balanced
end

function closingbrackets(opening_bracket::Char)
    if opening_bracket == '['
        return ']'
    elseif opening_bracket == '{'
        return '}'
    elseif opening_bracket == '('
        return ')'
    else
        return error("Not a valid bracket")
    end
end
