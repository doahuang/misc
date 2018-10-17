def fibonacci(n, current = 1, prev = 0)
  return prev if n == 0
  return current if n == 1
  
  fibonacci(n - 1, current + prev, current)
end

# def fibonacci(n)
#   table = { 0 => 0, 1 => 1 }
  
#   return table[n] if table[n]
  
#   (2..n).each do |i|
#     table[i] = table[i - 2] + table[i - 1]
#   end
  
#   table[n]
# end

# def fibonacci(n)
#   table = { 0 => 0, 1 => 1 }
  
#   return table[n] if table[n]
  
#   fib = fibonacci(n - 2) + fibonacci(n - 1)
  
#   table[n] = fib
# end