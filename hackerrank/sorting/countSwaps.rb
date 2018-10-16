def countSwaps(a)
  n = a.length
  count = 0
  
  (0...n).each do |i|
    (0...n - 1).each do |j|
      if a[j] > a[j + 1]
        a[j], a[j + 1] = a[j + 1], a[j]
        count += 1
      end
    end
  end
  
  puts "Array is sorted in #{count} swaps."
  puts "First Element: #{a[0]}"
  puts "Last Element: #{a[-1]}"
end