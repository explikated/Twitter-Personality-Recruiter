require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'
require './criteria'

dict = {}

#Read in username/status dictionary
usersf= File.open("users", "a+").each { |line|
	particip = line.split()

	if dict.has_key?(particip[0]) == false
		dict [particip[0]] = particip[1]
	else
		#ERROR something went wrong building the user dictionary
	end
	#User dictionary now includes all existing participants
}

id_counterf = File.open("id counter", "r")
id_counters = id_counterf.readline
id_counter = Integer(id_counters)
id_counterf.close
puts id_counter

search = Twitter::Search.new
search_terms = ["me"] 
result = search.lang('en').geocode(41,-74,"250mi").containing(search_terms.join(" OR "))
result.each do |tweet|
	if dict.has_key?(tweet.from_user) == false
		#Check activity restraints
		stream = Twitter::Client.new
		opt = {}
		#Grab this many tweets from the user
		opt["count"] = 1
		res = stream.user_timeline(tweet.from_user, opt)
		tmp = res.last.created_at.split()
		m, d = tmp[1], tmp[2]
		if criteria(m,d) == 1
			Dir.mkdir("user_data") unless Dir.exists?("user_data")
			streamf = File.new("../user_data/"+tweet.from_user,"w")
			res.each do |old_tweet|
				line = old_tweet.text + "\n-----------------\n"
				streamf.write(line)
			end
			streamf.close
		end
		#Add to dictionary
		dict[tweet.from_user] = id_counter
		usersf.write(tweet.from_user + " " + id_counter.to_s + "\n")
		id_counter += 1
	else
		#what to do if user exists
		puts "got a repeater doc!"
	end
end
id_counterff = File.open("id counter", "w")
id_counterff.write(id_counter.to_s)
id_counterff.close
usersf.close
