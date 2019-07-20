## Not finished!#

#=
Conway's Game of Life takes place on an infinite two-dimensional board of square cells. Each cell is either dead or alive, and at each tick, the following rules apply:

    Any live cell with less than two live neighbours dies.
    Any live cell with two or three live neighbours remains living.
    Any live cell with more than three live neighbours dies.
    Any dead cell with exactly three live neighbours becomes a live cell.

A cell neighbours another cell if it is horizontally, vertically, or diagonally adjacent.

Implement Conway's Game of Life. It should be able to be initialized with a starting list of live cell coordinates and the number of steps it should run for. Once initialized, it should print out the board state at each step. Since it's an infinite board, print out only the relevant coordinates, i.e. from the top-leftmost live cell to bottom-rightmost live cell.

You can represent a live cell with an asterisk (*) and a dead cell with a dot (.).
=#

function ConwayGameOfLife(livecells, steps::Int)
    board = initialize(livecells)
    for step in 0:steps
        println("Step: $step")
        display(board)
        for cell_i in 1:size(board, 1)
            for cell_j in 1:size(board, 2)
                board[cell_index] = nextstatus(cell_i, cell_j, board)
            end
        end
    end
end

function initialize(livecells)
    board = fill(".", maximum(livecells[:,1]), maximum(livecells[:,2]))
    for living_cell in 1:size(livecells, 1)
        board[livecells[living_cell, 1], livecells[living_cell, 2]] = "*"
    end
    return board
end

function nextstatus(cell_i, cell_j, board)
    previous_status = board[cell_i, cell_j]
    livingneighbour = livingneighbours(cell_i, cell_j, board)
    if previous_status == "*" && livingneighbour < 2
        new_status = "."
    elseif previous_status == "*" && livingneighbour >= 2 && livingneighbour <= 3
        new_status = "*"
    elseif previous_status == "*" && livingneighbour > 3
        new_status = "."
    elseif previous_status == "." && livingneighbour == 3
        new_status = "*"
    else
        new_status = previous_status
    end
    return new_status
end

function livingneighbours(cell_i, cell_j, board)

end

# Create random board
livecells = []
for i in 1:10
    push!(livecells, rand(collect(1:4)),rand(collect(1:4)))
end
livecells = reshape(livecells, 10, 2)
