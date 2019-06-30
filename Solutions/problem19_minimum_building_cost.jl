#=
A builder is looking to build a row of N houses that can be of K different colors. He has a goal of minimizing cost while ensuring that no two neighboring houses are of the same color.

Given an N by K matrix where the nth row and kth column represents the cost to build the nth house with kth color, return the minimum cost which achieves this goal.
=#

function minimum_building_cost(cost_matrix)
    # Create a matrix with the cumulative minimum cost of building the nth house (row) with the kth color (column)
    cumulative_minimum_cost = zeros(Float64, size(cost_matrix))
    # For the first house, it is the first row of the cost_matrix
    cumulative_minimum_cost[1,:] = cost_matrix[1,:]
    number_of_colors = size(cost_matrix, 2)
    number_of_houses = size(cost_matrix, 1)
    # For the second to last houst, for each color, the minimum cumulative cost is the price of building the house in that color + the minimum cumulative cost of building the last house in a different color
    for house in 2:number_of_houses
        for color in 1:number_of_colors
            allowed_prev_colors = setdiff(1:number_of_colors, color)
            cumulative_minimum_cost[house, color] = cost_matrix[house, color] + minimum(cumulative_minimum_cost[house-1,allowed_prev_colors])
        end
    end
    # We want the minimum cost of building all the house
    minimum_cost = minimum(cumulative_minimum_cost[end,:])
    return minimum_cost
end
