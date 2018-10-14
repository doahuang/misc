def sockMerchant(n, ar)
  socks = {}
  pairs = 0
  
  ar.each do |color|
    if !socks[color]
      socks[color] = true
    else
      pairs += 1
      socks[color] = false
    end
  end
  
  pairs
end