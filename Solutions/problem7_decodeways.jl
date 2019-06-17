#=
Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.

For example, the message '111' would give 3, since it could be decoded as 'aaa', 'ka', and 'ak'.

You can assume that the messages are decodable. For example, '001' is not allowed.
=#

function iscode(code)
    if typeof(code) == String
        code = parse(Int, code)
    end
    if code >= 1 && code <= 26
        return true
    else
        return false
    end
end

function count_ways(code)
    if typeof(code) == String
        code = parse(Int, code)
    end
    length_code = length(string(code))
    count = 0
    if length_code == 1
        count = 1
    elseif length_code == 2 && iscode(code)
        count = 2
    elseif length_code == 2 && iscode(code) == false
        count = 1
    else
        if iscode(string(code)[1:2])
            count = count_ways(string(code)[3:end]) + count
        end
        count = count_ways(string(code)[2:end]) + count
    end
    return count
end
