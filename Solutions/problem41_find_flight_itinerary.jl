#=
Given an unordered list of flights taken by someone, each represented as (origin, destination) pairs, and a starting airport, compute the person's itinerary. If no such itinerary exists, return null. If there are multiple possible itineraries, return the lexicographically smallest one. All flights must be used in the itinerary.

For example, given the list of flights [('SFO', 'HKO'), ('YYZ', 'SFO'), ('YUL', 'YYZ'), ('HKO', 'ORD')] and starting airport 'YUL', you should return the list ['YUL', 'YYZ', 'SFO', 'HKO', 'ORD'].

Given the list of flights [('SFO', 'COM'), ('COM', 'YYZ')] and starting airport 'COM', you should return null.

Given the list of flights [('A', 'B'), ('A', 'C'), ('B', 'C'), ('C', 'A')] and starting airport 'A', you should return the list ['A', 'B', 'C', 'A', 'C'] even though ['A', 'C', 'A', 'B', 'C'] is also a valid itinerary. However, the first one is lexicographically smaller.
=#

function finditinerary(flights::Array{Tuple{String,String},1}, starting_airport::String)
    itinerary = [starting_airport]
    departure = starting_airport
    flights_left = copy(flights)
    while length(flights_left) != 0
        nextflight = findnextflight(flights_left, departure)
        if isnothing(nextflight)
            flights_left = []
            itinerary = nothing
        else
            push!(itinerary, nextflight[2])
            departure = nextflight[2]
            setdiff!(flights_left, [nextflight])
        end
    end
    return itinerary
end

function findnextflight(flights, departure)
    possible_flights = []
    possible_arrivals = []
    for flight in flights
        if flight[1] == departure
            push!(possible_flights, flight)
            push!(possible_arrivals, flight[2])
        end
    end
    if length(possible_flights) == 0
        nextflight = nothing
    elseif length(possible_flights) == 1
        nextflight = possible_flights[1]
    else
        nextflight = possible_flights[findmin(possible_arrivals)[2]]
    end
    return nextflight
end
