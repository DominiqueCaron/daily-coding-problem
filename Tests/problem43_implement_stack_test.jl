#=
Implement a stack that has the following methods:

    push(val), which pushes an element onto the stack
    pop(), which pops off and returns the topmost element of the stack. If there are no elements in the stack, then it should throw an error or return null.
    max(), which returns the maximum value in the stack currently. If there are no elements in the stack, then it should throw an error or return null.

Each method should run in constant time.
=#

using Test
include("Solutions/problem43_implement_stack.jl")

push(2)
push(5)

@test stack == [2, 5]
@test max() == 5
@test pop() == 5
@test stack == [2]
@test pop() == 2
@test stack == []
@test isnothing(max())
@test isnothing(pop())
