def jumpingOnClouds(c)
  jumps = 0
  current = 0
  last = c.length - 1

  while current < last
    two_away = c[current + 2]

    current += two_away == 1 ? 1 : 2

    jumps += 1
  end

  jumps
end