using Test
include("../Solutions/problem3_serialize_deserialize.jl")

struct Node
    val
    left
    right
end

function Node(val; left = "", right = "")
    Node(val, left, right)
end

node = Node("root", Node("left", left = Node("left.left")), Node("right"))

@test deserialize(serialize(node)).left.left.val == "left.left"
