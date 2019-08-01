#=
Suppose an arithmetic expression is given as a binary tree. Each leaf is an integer and each internal node is one of '+', '−', '∗', or '/'.

Given the root to such a tree, write a function to evaluate it.

For example, given the following tree:

    *
   / \
  +    +
 / \  / \
3  2  4  5

You should return 45, as it is (3 + 2) * (4 + 5).
=#

struct Node
    key::Union{Int, Char}
    left::Union{Node, Int}
    right::Union{Node, Int}
end

function evaluate(tree::Node)
    out = 0
    if typeof(tree.left) == Int && typeof(tree.right) == Int
        if tree.key == '+'
            out = tree.left + tree.right
        elseif tree.key == '-'
            out = tree.left - tree.right
        elseif tree.key == '*'
            out = tree.left * tree.right
        elseif tree.key == '/'
            out = tree.left / tree.right
        end
    elseif typeof(tree.left.key) == Char && typeof(tree.right.key) == Char
        if tree.key == '+'
            out = evaluate(tree.left) + evaluate(tree.right)
        elseif tree.key == '-'
            out = evaluate(tree.left) - evaluate(tree.right)
        elseif tree.key == '*'
            out = evaluate(tree.left) * evaluate(tree.right)
        elseif tree.key == '/'
            out = evaluate(tree.left) / evaluate(tree.right)
        end
    end
    return out
end
