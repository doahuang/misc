def repeatedString(s, n)
  return n if s == 'a'
  return 0 unless s.include?('a')
  
  left = n % s.length
  
  s.count('a') * (n / s.length) + s[0...left].count('a')
end