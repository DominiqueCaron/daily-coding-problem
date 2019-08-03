#=
Implement a queue using two stacks. Recall that a queue is a FIFO (first-in, first-out) data structure with the following methods: enqueue, which inserts an element into the queue, and dequeue, which removes it.
=#

using Test
include("Solutions/problem53_queue_from_two_stack.jl")

queue= Queue([],[])
enqueue(queue,1)
enqueue(queue,2)
enqueue(queue,3)
enqueue(queue,4)
enqueue(queue,5)

@test dequeue(queue) == 1
@test dequeue(queue) == 2
enqueue(queue, 6)
@test dequeue(queue) == 3
