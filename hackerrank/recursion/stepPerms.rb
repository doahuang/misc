def stepPerms(n, a = 1, b = 1, c = 2)
  return a if n == 0
  return b if n == 1
  return c if n == 2
  
  stepPerms(n - 1, b, c, a + b + c)
end

# def stepPerms(n)
#   ways = { 0 => 1, 1 => 1, 2 => 2 }
  
#   (3..n).each do |height|
#     ways[height] = 
#       ways[height - 1] + 
#       ways[height - 2] + 
#       ways[height - 3]
#   end

#   ways[n]
# end