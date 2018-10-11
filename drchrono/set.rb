# Sets is a matching game, played with a special deck of cards. Each
# card in the deck has a pictogram on it.
#
# Each pictogram has four properties; each property has three choices:
#
#   - Shape   (pill/diamond/squiggle)
#   - Number  (1/2/3)
#   - Color   (red/green/purple)
#   - Fill    (solid/open/hatch)
#
# The deck is made up of one card with each possible combination of
# properties. No two cards are exactly the same.
#
# The objective of the game is to find sets of three cards which
# form a "set". A set is formed when ALL of the following are true
# about a group of three cards:
#
# - They all have the same number or have three different numbers.
# - They all have the same shape or have three different shapes.
# - They all have the same fill or have three different fills.
# - They all have the same color or have three different colors.
#
# Here's an example
# https://mrrgteacher.files.wordpress.com/2011/12/sets_examples1-1024x586.png
# https://d2r55xnwy6nx47.cloudfront.net/uploads/2016/05/SETPoint_2000.png

# different properties a card can have
properties = {
  shape: ['Pill', 'Diamond', 'Squiggle'],
  number: [1, 2, 3],
  color: ['Red', 'Green', 'Purple'],
  fill: ['Solid', 'Open', 'Hatch'],
}

# example of a card instance
card = {
  shape: 'Pill',
  number: 2,
  color: 'Purple',
  fill: 'Solid',
}

require 'set'
def is_valid?(cards)
  total = cards.length 

  seen = {
    color: [],
    shape: [],
    fill: [],
    number: [] 
  }
  
  cards.each do |card|
    card.keys.each do |prop|
      seen[prop] << card[prop]
    end
  end
  
  seen.values.all? do |arr|
    length = arr.uniq.length
    # checking if all diff or all same
    length == 1 || length == total
  end
end



# valid
# ['Pill', 3, 'Red', 'Solid']
# ['Diamond', 2, 'Green', 'Hatch']
# ['Squiggle', 1, 'Purple', 'Open']
card1 = {
  shape: 'Pill',
  number: 3,
  color: 'Red',
  fill: 'Solid',
}
card2 = {
  shape: 'Diamond',
  number: 2,
  color: 'Green',
  fill: 'Hatch',
}
card3 = {
  shape: 'Squiggle',
  number: 1,
  color: 'Purple',
  fill: 'Open',
}



# valid
# ['Pill', 2, 'Green', 'Open']
# ['Diamond', 2, 'Green', 'Hatch']
# ['Squiggle', 2, 'Green', 'Solid']
card4 = {
  shape: 'Pill',
  number: 2,
  color: 'Green',
  fill: 'Open',
}
card5 = {
  shape: 'Diamond',
  number: 2,
  color: 'Green',
  fill: 'Hatch',
}
card6 = {
  shape: 'Squiggle',
  number: 2,
  color: 'Green',
  fill: 'Solid',
}


# not valid
# ['Pill', 2, 'Green', 'Solid']
# ['Diamond', 2, 'Green', 'Hatch']
# ['Squiggle', 2, 'Green', 'Solid']
card7 = {
  shape: 'Pill',
  number: 2,
  color: 'Green',
  fill: 'Solid',
}
card8 = {
  shape: 'Diamond',
  number: 2,
  color: 'Green',
  fill: 'Hatch',
}
card9 = {
  shape: 'Squiggle',
  number: 2,
  color: 'Green',
  fill: 'Solid',
}

p is_valid?([card1, card2, card3]) == true
p is_valid?([card4, card5, card6]) == true 
p is_valid?([card7, card8, card9]) == false