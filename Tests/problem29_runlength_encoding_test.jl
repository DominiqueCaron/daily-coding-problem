#=
Run-length encoding is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count and character. For example, the string "AAAABBBCCDAA" would be encoded as "4A3B2C1D2A".

Implement run-length encoding and decoding. You can assume the string to be encoded have no digits and consists solely of alphabetic characters. You can assume the string to be decoded is valid.
=#

using Test
include("Solutions/problem29_runlength_encoding.jl")

@test encode("AAAABBBCCDAA") == "4A3B2C1D2A"
@test decode("4A3B2C1D2A") == "AAAABBBCCDAA"
