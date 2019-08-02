#=
Implement an LRU (Least Recently Used) cache. It should be able to be initialized with a cache size n, and contain the following methods:

    set(key, value): sets key to value. If there are already n items in the cache and we are adding a new item, then it should also remove the least recently used item.
    get(key): gets the value at key. If no such key exists, return null.

Each operation should run in O(1) time.
=#

mutable struct LRU_cache
    cache::Dict{String, Int}
    n::Int
    key::Array{String, 1}
end

function LRU_cache(n::Int)
    LRU_cache(Dict(), n, [])
end

function set(key::String,value::Int)
    LRU.cache[key] = value
    push!(LRU.key, key)
    if length(LRU.cache) > LRU.n
        key_to_remove = LRU.key[1]
        delete!(LRU.cache, key_to_remove)
        popfirst!(LRU.key)
    end
end

function get(key::String)
    try
        return LRU.cache[key]
    catch
        return nothing
    end
end
