def countingValleys(n, s)
  count = 0
  level = 0
  in_valley = false
  
  s.chars.each do |step|
    in_valley = level < 0
    
    level += step == 'D' ? -1 : 1
    
    count += 1 if in_valley && level == 0
  end
  
  count
end