#=
Implement regular expression matching with the following special characters:

    . (period) which matches any single character
    * (asterisk) which matches zero or more of the preceding element

That is, implement a function that takes in a string and a valid regular expression and returns whether or not the string matches the regular expression.

For example, given the regular expression "ra." and the string "ray", your function should return true. The same regular expression on the string "raymond" should return false.

Given the regular expression ".*at" and the string "chat", your function should return true. The same regular expression on the string "chats" should return false.
=#

function match_regex(regular_expr::String, s::String)
    is_matching = true
    index = 1
    rest_of_string = s
    while is_matching && index != length(regular_expr)+1
        if index != length(regular_expr) && regular_expr[index+1] == '*'
            repeated_char = regular_expr[index]
            if repeated_char == '.'
                while index != length(regular_expr) && regular_expr[index+1] != rest_of_string[1]
                    index = index + 1
                    rest_of_string = rest_of_string[2:end]
                end
            else
                while findnext(repeated_char, rest_of_string, 1) == 1
                    index = index + 1
                    rest_of_string = rest_of_string[2:end]
                end
            end
        elseif regular_expr[index] == '.'
            is_matching = true
            index = index + 1
            rest_of_string = rest_of_string[2:end]
        elseif regular_expr[index] == rest_of_string[1]
            is_matching =true
            rest_of_string = rest_of_string[2:end]
            index = index + 1
        else
            is_matching = false
            index = index + 1
        end
    end
    if rest_of_string != ""
        is_matching = false
    end
    return is_matching
end
