def checkMagazine(magazine, note)
  words = Hash.new(0)
  
  magazine.each do |el|
    words[el] += 1
  end
  
  note.each do |el|
    words[el] -= 1
    return 'No' if words[el] < 0
  end
  
  'Yes'
end
