#=
Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
=#

function addupto(X, k)
    for i in 1:length(X)-1
        for j in i+1:length(X)
             if X[i]+X[j] == k
                 return true
             end
        end
    end
    return false
end
