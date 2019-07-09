#=
Run-length encoding is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count and character. For example, the string "AAAABBBCCDAA" would be encoded as "4A3B2C1D2A".

Implement run-length encoding and decoding. You can assume the string to be encoded have no digits and consists solely of alphabetic characters. You can assume the string to be decoded is valid.
=#

function encode(decoded_string::String)
    encoded_string = ""
    while decoded_string != "1"
        character = decoded_string[1:1]
        number = 0
        while decoded_string[1:1] == character
            number = number + 1
            if length(decoded_string) >=2
                decoded_string = decoded_string[2:end]
            else
                decoded_string = "1"
            end
        end
        encoded_string = encoded_string * string(number) * character
    end
    return encoded_string
end

function decode(encoded_string::String)
    decoded_string = ""
    while encoded_string != "finished"
        decoded_string = decoded_string * repeat(encoded_string[2:2], parse(Int8, encoded_string[1:1]))
        if length(encoded_string) >2
            encoded_string = encoded_string[3:end]
        else
            encoded_string = "finished"
        end
    end
    return decoded_string
end
