#=
Given a array of numbers representing the stock prices of a company in chronological order, write a function that calculates the maximum profit you could have made from buying and selling that stock once. You must buy before you can sell it.

For example, given [9, 11, 8, 5, 7, 10], you should return 5, since you could buy the stock at 5 dollars and sell it at 10 dollars.
=#

function maximumprofit(stockprices::Array{Int,1})
    max_profit = 0
    for index in eachindex(stockprices[1:end-1])
        current_profit = maximum(stockprices[index+1:end]) - stockprices[index]
        if current_profit > max_profit
            max_profit = current_profit
        end
    end
    return max_profit
end
