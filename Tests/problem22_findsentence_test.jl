#=
Given a dictionary of words and a string made up of those words (no spaces), return the original sentence in a list. If there is more than one possible reconstruction, return any of them. If there is no possible reconstruction, then return null.

For example, given the set of words 'quick', 'brown', 'the', 'fox', and the string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].

Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or ['bedbath', 'and', 'beyond'].
=#

using Test
include("Solutions/problem22_findsentence.jl")

s = "thequickbrownfox"
dictionary = ["quick", "brown", "the", "fox"]

@test find_sentence(s, dictionary) == ["the", "quick", "brown", "fox"]

s = "bedbathandbeyond"
dictionary = ["bed", "bath", "bedbath", "and", "beyond"]

@test find_sentence(s, dictionary) == ["bed", "bath", "and", "beyond"] || find_sentence(s, dictionary) == ["bedbath", "and", "beyond"]
