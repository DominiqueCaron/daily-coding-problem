#=
Using a function rand5() that returns an integer from 1 to 5 (inclusive) with uniform probability, implement a function rand7() that returns an integer from 1 to 7 (inclusive).
=#

function rand5()
    return rand(1:5)
end

function rand7()
    x = 100
    # Create a number between 1 to 21
    while x > 21
        x = rand5() * 5 + rand5() - 5 #uniform probability of having 5, 10, 15, 20 and 25 minus a number between 0 and 4
    end
    return x % 7 + 1
end
