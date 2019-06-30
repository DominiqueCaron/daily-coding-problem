#=
Given two singly linked lists that intersect at some point, find the intersecting node. The lists are non-cyclical.

For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return the node with value 8.

In this example, assume nodes with the same value are the exact same node objects.

Do this in O(M + N) time (where M and N are the lengths of the lists) and constant space.
=#
struct Node
    val::Int64
    next::Union{Nothing, Node}
end

function findintersect(A::Node, B::Node)
    all_nodes_A = Node[]
    current_node = A
    while !isnothing(current_node)
        push!(all_nodes_A, current_node)
        current_node = current_node.next
    end
    intersecting_node = B
    while !(intersecting_node in all_nodes_A)
        intersecting_node = intersecting_node.next
    end
    return intersecting_node
end
