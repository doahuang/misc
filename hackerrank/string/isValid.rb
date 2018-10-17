def isValid(s)
  chars = Hash.new(0)
  counts = Hash.new(0)
  
  s.chars.each do |el|
    chars[el] += 1
  end
  
  chars.values.each do |val|
    counts[val] += 1

    return 'NO' if counts.length > 2
  end
  
  return 'YES' if counts.length == 1
  
  min, max = counts.keys.minmax
  
  if counts[max] == 1
    return 'YES' if max - min == 1
  elsif counts[min] == 1
    return 'YES' if min == 1 || max - min == 1
  end
  
  'NO'
end