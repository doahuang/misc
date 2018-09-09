require 'csv'
require 'json'

t1 = CSV.table('./source1.csv')
t2 = CSV.table('./source2.csv')
init = Time.now

# 1. what was the total spent against people with purple hair?

purples = {}
t1.each do |row|
  id = row[:campaign_id]
  hair = row[:audience].split('_')[1]
  purples[id] = true if hair == 'purple'
end

total = 0
t2.each do |row|
  id = row[:campaign_id]
  total += row[:spend] if purples[id]
end
p total

# 2. how many campaigns spent on more than 4 days? 

dates = {}
t2.each do |row|
  id = row[:campaign_id]
  dates[id] = [] unless dates[id]

  day = row[:date]
  dates[id] << day unless dates[id].any?(day)
end

count = 0
dates.each do |id, days|
  count += 1 if days.length > 4
end
p count

# 3. how many times did source H report on clicks?

count = 0
t2.each do |row|
  acts = JSON.parse(row[:actions])
  acts.each do |act|
    count += 1 if act['H'] && act['action'] == 'clicks'
  end
end
p count

# 4. which sources reported more "junk" than "noise"?

report = {}
t2.each do |row|
  acts = JSON.parse(row[:actions])
  acts.each do |act|
    source = act.keys[0]
    report[source] = [0, 0] unless report[source]

    case act['action']
    when 'junk'
      report[source][0] += act[source]
    when 'noise'
      report[source][1] += act[source]
    else 
      next
    end
  end
end

sources = []
report.each do |source, (junk, noise)| 
  sources << source if junk > noise
end
p sources

# 5. what was the total cost per view for all video ads, truncated to two decimal places?

cost = 0
views = 0

t2.each do |row|
  next unless row[:ad_type] == 'video'
  
  cost += row[:spend]

  acts = JSON.parse(row[:actions])
  acts.each do |act|
    source = act.keys[0]
    views += act[source] if act['action'] == 'views'
  end
end
cpv = (cost.to_f / views).round(2)
p cpv

# 6. how many source B conversions were there for campaigns targeting NY?

ny = {}
t1.each do |row|
  id = row[:campaign_id]
  state = row[:audience].split('_')[0]
  ny[id] = true if state == 'NY'
end

count = 0
t2.each do |row|
  id = row[:campaign_id]
  next unless ny[id]

  acts = JSON.parse(row[:actions])
  acts.each do |act|
    count += act['B'] if act['B'] && act['action'] == 'conversions'
  end
end
p count

# 7. what combination of state and hair color had the best CPM? 

cost = {}
t2.each do |row|
  id = row[:campaign_id]
  cost[id] = 0 unless cost[id]
  cost[id] += row[:spend]
end

cost.reject! do |id, spend|
  spend > 0
end

camp = {}
t1.each do |row|
  id = row[:campaign_id]
  next unless cost[id]

  state, hair, _ = row[:audience].split('_')
  camp[id] = [state, hair]
end
p camp.values
puts "\nrun time: #{Time.now - init} seconds"