using Test
include("../Solutions/problem2_product_except_i.jl")
@test product_excepti([1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24]
@test product_excepti([3, 2, 1]) == [2, 3, 6]
