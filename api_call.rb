require 'net/http'
require 'json'

params = { 
  term: 'boba', 
  location: 'san leandro', 
  limit: 5
}

http = Net::HTTP 

url = 'http://eat.whosdoa.com/api/'
path = 'yelp'

uri = URI.parse(url + path)
uri.query = URI.encode_www_form(params)

res = http.get(uri)

json = JSON.parse(res)

bizs = json['businesses']

bizs.each do |biz|
  name = biz['name']
  addr = biz['location']['display_address'].join(', ')
  p [name, addr]
end