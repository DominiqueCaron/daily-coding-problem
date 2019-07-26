#=
We can determine how "out of order" an array A is by counting the number of inversions it has. Two elements A[i] and A[j] form an inversion if A[i] > A[j] but i < j. That is, a smaller element appears after a larger element.

Given an array, count the number of inversions it has. Do this faster than O(N^2) time.

You may assume each element in the array is distinct.

For example, a sorted list has zero inversions. The array [2, 4, 1, 3, 5] has three inversions: (2, 1), (4, 1), and (4, 3). The array [5, 4, 3, 2, 1] has ten inversions: every distinct pair forms an inversion.
=#

function inversions(A::Array{Int, 1})
    B = copy(A)
    number_of_inversions = 0
    while length(B) != 1
        if findmin(B)[2] != 1
            number_of_inversions = number_of_inversions + sum(B[1] .> B[2:end])
        end
        B = B[2:end]
    end
    return number_of_inversions
end
