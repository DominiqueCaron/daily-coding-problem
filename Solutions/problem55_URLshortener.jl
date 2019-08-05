#=
Implement a URL shortener with the following methods:

    shorten(url), which shortens the url into a six-character alphanumeric string, such as zLg6wl.
    restore(short), which expands the shortened string into the original url. If no such shortened string exists, return null.

Hint: What if we enter the same URL twice?
=#
using Random
global url_list = Dict{String, String}()

function shorten(url::String)
    if !in(url, values(url_list))
        shortened_url = randstring(6)
        while in(shortened_url, keys(url_list))
            shortened_url = randstring(6)
        end
        url_list[shortened_url] = url
    else
        shortened_url = collect(keys(url_list))[collect(values(url_list)) .== url][1]
    end
    return shortened_url
end

function restore(shortened_url)
    if in(shortened_url, keys(url_list))
        return url_list[shortened_url]
    else
        return nothing
    end
end
