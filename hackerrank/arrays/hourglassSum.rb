def hourglassSum(arr)
  max = nil
  
  arr.each_with_index do |row, y|
    row.each_with_index do |col, x|
      third = arr[y + 2]
      break if !row[x + 2] || !third 
      
      sum = row[x..x + 2].sum
      sum += arr[y + 1][x + 1]
      sum += third[x..x + 2].sum
      
      if !max
        max = sum
      else
        max = sum if sum > max
      end
    end
  end
  
  max
end