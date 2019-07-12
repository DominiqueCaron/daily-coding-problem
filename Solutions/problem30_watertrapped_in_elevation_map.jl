#=
You are given an array of non-negative integers that represents a two-dimensional elevation map where each element is unit-width wall and the integer is the height. Suppose it will rain and all spots between two walls get filled up.

Compute how many units of water remain trapped on the map in O(N) time and O(1) space.

For example, given the input [2, 1, 2], we can hold 1 unit of water in the middle.

Given the input [3, 0, 1, 3, 0, 5], we can hold 3 units in the first index, 2 in the second, and 3 in the fourth index (we cannot hold 5 since it would run off to the left), so we can trap 8 units of water.
=#

function watertrapped(elevation_map::Array{Int64, 1})
    sum_water = 0
    for map_unit in 2:length(elevation_map)-1
        max_left = maximum(elevation_map[1:map_unit-1])
        max_right = maximum(elevation_map[map_unit+1:end])
        water_trapped = maximum([minimum([max_left, max_right]) - elevation_map[map_unit], 0])
        sum_water = sum_water + water_trapped
    end
    return sum_water
end
