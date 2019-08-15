#=
Implement integer exponentiation. That is, implement the pow(x, y) function, where x and y are integers and returns x^y.

Do this faster than the naive method of repeated multiplication.

For example, pow(2, 10) should return 1024.
=#

function pow(x::Int, y::Int)
    if y == 0
        return 1
    elseif y % 2 == 0
        return pow(x, Int(y/2)) * pow(x, Int(y/2))
    else
        return x * pow(x,Int((y-1)/2)) * pow(x,Int((y-1)/2))
    end
end
