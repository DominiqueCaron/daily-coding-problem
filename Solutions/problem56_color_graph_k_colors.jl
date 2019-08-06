#=
Given an undirected graph represented as an adjacency matrix and an integer k, write a function to determine whether each vertex in the graph can be colored such that no two adjacent vertices share the same color using at most k colors.
=#

graph = [0 1 1 0;1 0 0 0;1 0 0 1;0 0 1 0]
colors = [1, 3,3,3]

function iscolorvalid(graph::Array{Int, 2}, colors::Array{Int, 1})
    vertex_index = length(colors)
    neighbors = findall(isequal(1), graph[vertex_index,:])
    colorvalid = true
    for neighbor in neighbors
        if neighbor <= vertex_index && colors[neighbor] == colors[vertex_index]
            colorvalid = false
        end
    end
    return colorvalid
end

function colorable(graph::Array{Int,2}, k::Int)
    is_colorable = true
    colors = Array{Int,1}()
    for vertex in 1:size(graph, 1)
        vertex_colored = false
        color = 1
        while color <= k && !vertex_colored
            push!(colors, color)
            if !iscolorvalid(graph, colors) && color == k
                is_colorable = false
                color = color + 1
            elseif !iscolorvalid(graph, colors) && color < k
                pop!(colors)
                color = color + 1
            else
                vertex_colored = true
            end
        end
    end
    return is_colorable
end
