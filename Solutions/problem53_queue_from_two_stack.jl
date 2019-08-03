#=
Implement a queue using two stacks. Recall that a queue is a FIFO (first-in, first-out) data structure with the following methods: enqueue, which inserts an element into the queue, and dequeue, which removes it.
=#

mutable struct Queue
    stack1::Array{Any, 1}
    stack2::Array{Any, 1}
end

function enqueue(queue::Queue, element::Any)
    push!(queue.stack1, element)
end

function dequeue(queue::Queue)
    while length(queue.stack1) > 0
        push!(queue.stack2, pop!(queue.stack1))
    end
    out = pop!(queue.stack2)
    while length(queue.stack2) > 0
        push!(queue.stack1, pop!(queue.stack2))
    end
    return out
end
