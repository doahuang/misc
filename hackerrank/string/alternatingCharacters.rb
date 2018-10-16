def alternatingCharacters(s)
  min_del = 0
  
  s.chars.each_with_index do |el, i|
    next_el = s[i + 1]
    
    min_del += 1 if el == next_el
  end

  min_del
end