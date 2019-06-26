#=
The area of a circle is defined as πr^2. Estimate π to 3 decimal places using a Monte Carlo method.

Hint: The basic equation of a circle is x2 + y2 = r2
=#
using Test
include("Solutions/problem14_estimate_pi.jl")

@test abs(estimate_pi() - pi) <= 0.001
@test abs(estimate_pi(number_of_decimal = 5) - pi) <= 0.00001
