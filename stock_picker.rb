def stock_picker(prices)
    if prices.length <= 1
        return nil
    end
    highest = []
    last_day = prices[prices.length - 1]
    while prices.length > 0 do
        highest << (prices.max - prices[0])
        prices.shift
    end
    profit = highest.max
    if profit <= 0
        return nil
    end
    buy_day = highest.index(profit)
    sell_day = highest.each_index.detect{ |index| index > buy_day && highest[index] == 0 }
    [buy_day, sell_day]
end

# Test case 1: Example input
stock_prices = [7, 1, 5, 3, 6, 4]
p stock_picker(stock_prices)  # [1, 4]

# Test case 2: Prices increasing over time
stock_prices = [1, 2, 3, 4, 5, 6]
p stock_picker(stock_prices)  # [0, 5]

# Test case 3: Prices decreasing over time
stock_prices = [6, 5, 4, 3, 2, 1]
p stock_picker(stock_prices)  # nil

# Test case 4: Multiple peaks and valleys
stock_prices = [1, 5, 2, 8, 3, 10]
p stock_picker(stock_prices)  # [0, 5]

# Test case 5: No profits possible
stock_prices = [5, 4, 3, 2, 1]
p stock_picker(stock_prices)  # nil

# Test case 6: Empty array
stock_prices = []
p stock_picker(stock_prices)  # nil

# Test case 7: Array with only one price
stock_prices = [10]
p stock_picker(stock_prices)  # nil
