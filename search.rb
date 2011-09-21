require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'

search = Twitter::Search.new
search_terms = ["hipster", "douchebag"] 
result = search.lang('en').geocode(41,-74,"250mi").containing(search_terms.join(" OR "))
result.each do |tweet|
	puts tweet.from_user
	puts tweet.text
	puts "--------------------------------------"
end
