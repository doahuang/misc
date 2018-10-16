def twoStrings(s1, s2)
  s1, s2 = s2, s1 if s1.length > s2.length
  
  chars = {}
  
  s1.chars.each do |el|
    chars[el] = true
  end
  
  s2.chars.each do |el|
    return 'YES' if chars[el]
  end
  
  'NO'
end