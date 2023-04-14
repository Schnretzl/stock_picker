def stock_picker(prices)
    #code
    # prices = [17,3,6,9,15,8,6,1,10]
    highest = []
    last_day = prices[prices.length - 1]
    while prices.length > 0 do
        highest << (prices.max - prices[0])
        prices.shift
    end
    profit = highest.max
    buy_day = highest.index(profit)
    sell_day = highest.each_index.detect{ |index| index > buy_day && highest[index] == 0 }
    # p sell_day
    [buy_day, sell_day]
end

p stock_picker([17,3,6,9,7,8,6,1,0])