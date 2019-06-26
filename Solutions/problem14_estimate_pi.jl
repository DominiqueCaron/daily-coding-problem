#=
The area of a circle is defined as πr^2. Estimate π to 3 decimal places using a Monte Carlo method.

Hint: The basic equation of a circle is x2 + y2 = r2
=#
function estimate_pi(;number_of_decimal::Int64 = 3)
    in = 0
    out = 0
    pi_estimated = 0.0
    n_points = 0
    while round(pi_estimated; digits = number_of_decimal) != round(pi; digits = number_of_decimal)
        x, y = rand(2)
        if (x^2 + y^2) <= 1
            in = in + 1
        end
        n_points = n_points + 1
        pi_estimated = in/n_points * 4
    end
    return pi_estimated
end
