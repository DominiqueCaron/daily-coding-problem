#=
Given a function that generates perfectly random numbers between 1 and k (inclusive), where k is an input, write a function that shuffles a deck of cards represented as an array using only swaps.

It should run in O(N) time.

Hint: Make sure each one of the 52! permutations of the deck is equally likely.
=#

function swap(deck::Array{Int,1}, card1_index::Int, card2_index::Int)
    newdeck = copy(deck)
    newdeck[card1_index] = deck[card2_index]
    newdeck[card2_index] = deck[card1_index]
    return newdeck
end

function randk(k::Int)
    return rand(1:k)
end

function shuffle(deck::Array{Int,1})
    for card_index in 1:52
        new_pos = randk(52)
        deck = swap(deck, card_index, new_pos)
    end
    return deck
end
