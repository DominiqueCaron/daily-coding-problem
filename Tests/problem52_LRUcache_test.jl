#=
Implement an LRU (Least Recently Used) cache. It should be able to be initialized with a cache size n, and contain the following methods:

    set(key, value): sets key to value. If there are already n items in the cache and we are adding a new item, then it should also remove the least recently used item.
    get(key): gets the value at key. If no such key exists, return null.

Each operation should run in O(1) time.
=#

using Test
include("Solutions/problem52_LRUcache.jl")

LRU = LRU_cache(3)
set("a", 1)
set("b", 2)
set("c", 3)
set("d", 4)

@test get("b") == 2
@test get("c") == 3
@test get("d") == 4
@test isnothing(get("a"))
