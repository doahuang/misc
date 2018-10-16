def maximumToys(prices, k)
  max = 0
  
  prices.sort.each do |price|
    k -= price
    break if k < 0 
    max += 1
  end
  
  max
end
