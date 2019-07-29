#=
Given a string, find the longest palindromic contiguous substring. If there are more than one with the maximum length, return any one.

For example, the longest palindromic substring of "aabcdcb" is "bcdcb". The longest palindromic substring of "bananas" is "anana".
=#

function longestpalindromicsubstring(s::String)
    longestpalindrome = ""
    for index in eachindex(s)
        current_palindrome = longestpalindromecenter(s, index)
        if length(current_palindrome) >= length(longestpalindrome)
            longestpalindrome = current_palindrome
        end
    end
    return longestpalindrome
end

function longestpalindromecenter(s::String, index::Int)
    longestpalindrome = s[index:index]
    i = 1
    if index != 1 && index != length(s)
        while index-i >= 1 && index+i <= length(s) && ispalindrome(s[index-i:index+i])
            longestpalindrome = s[index-i:index+i]
            i = i + 1
        end
    end
    i = i-1
    if index+i < length(s)
        if ispalindrome(s[index-i:index+i+1])
            longestpalindrome = s[index-i:index+i+1]
        end
    end
    if index-i > 1
        if ispalindrome(s[index-i-1:index+i])
            longestpalindrome = s[index-i-1:index+i]
        end
    end
    return longestpalindrome
end

function ispalindrome(s::String)
    if isodd(length(s))
        half = floor(Int8, length(s)/2)
        is_palindrome = s[1:half] == reverse(s[half+2:end])
    else
        half = floor(Int8, length(s)/2)
        is_palindrome = s[1:half] == reverse(s[half+1:end])
    end
    return is_palindrome
end
