def makeAnagram(a, b)
  chars = Hash.new(0)
  
  a.chars.each do |el|
    chars[el] += 1
  end
  
  b.chars.each do |el|
    chars[el] -= 1
  end
  
  chars.values.reduce(0) do |sum, val|
    sum + val.abs
  end
end