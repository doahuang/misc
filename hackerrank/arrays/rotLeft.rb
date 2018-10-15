def rotLeft(a, d)
  left = d % a.length
  
  a.drop(left) + a.take(left)
end