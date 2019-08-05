#=
Implement a URL shortener with the following methods:

    shorten(url), which shortens the url into a six-character alphanumeric string, such as zLg6wl.
    restore(short), which expands the shortened string into the original url. If no such shortened string exists, return null.

Hint: What if we enter the same URL twice?
=#

using Test
include("Solutions/problem55_URLshortener.jl")

Random.seed!(123)
@test shorten("google.ca") == "4UkInf"
@test shorten("google.ca") == "4UkInf"
@test shorten("amazon.com") == "edi7B7"

@test restore("4UkInf") == "google.ca"
@test isnothing(restore("df211sdd"))
