#=
Given an array of time intervals (start, end) for classroom lectures (possibly overlapping), find the minimum number of rooms required.

For example, given [(30, 75), (0, 50), (60, 150)], you should return 2.
=#

function number_of_rooms_required(lecture_intervals::Array{Tuple{Int64,Int64},1})
    if length(lecture_intervals) == 0
        n_room = 0
    else
        room_reserved = [[0:0]]
        for lecture in lecture_intervals
            room_reserved = reserve_room(lecture, room_reserved)
        end
        n_room = length(room_reserved)
    end
    return n_room
end

function reserve_room(lecture::Tuple{Int64,Int64}, room_reserved::Array{Array{UnitRange{Int64},1},1})
    isbooked = false
    room = 1
    while !isbooked
        if room == length(room_reserved) && !isavailable(lecture, room_reserved[room])
            push!(room_reserved, [lecture[1]:lecture[end]])
            isbooked = true
        elseif isavailable(lecture, room_reserved[room])
            push!(room_reserved[room], lecture[1]:lecture[end])
            sort!(room_reserved[room])
            isbooked = true
        else
            room = room + 1
        end
    end
    return room_reserved
end

function isavailable(lecture::Tuple{Int64,Int64}, room_reserved::Array{UnitRange{Int64},1})
    room_available = false
    for lecture_in_room in 1:length(room_reserved)
        # before the first lecture?
        if lecture_in_room == 1 && minimum(room_reserved[lecture_in_room]) >= lecture[end]
            room_available = true
        elseif lecture_in_room == length(room_reserved) && maximum(room_reserved[lecture_in_room]) <= lecture[1] # after last lecture
            room_available = true
        elseif lecture_in_room != 1 && (minimum(room_reserved[lecture_in_room]) >= lecture[end] && maximum(room_reserved[lecture_in_room-1]) <= lecture[1])
            room_available = true
        end
    end
    return room_available
end
