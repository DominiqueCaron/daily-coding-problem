#=
Implement a stack that has the following methods:

    push(val), which pushes an element onto the stack
    pop(), which pops off and returns the topmost element of the stack. If there are no elements in the stack, then it should throw an error or return null.
    max(), which returns the maximum value in the stack currently. If there are no elements in the stack, then it should throw an error or return null.

Each method should run in constant time.
=#

global stack = []

function push(val)
    global stack = vcat(stack, val)
end

function pop()
    if length(stack) == 0
        return nothing
    else
        out = stack[end]
        global stack = stack[1:end-1]
        return out
    end
end

function max()
    if length(stack) == 0
        return nothing
    else
        return maximum(stack)
    end
end
