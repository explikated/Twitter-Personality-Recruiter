require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'
require './criteria'

#TODO write to log file search started
dict = {}

statusf= File.open("status", "a+")

#Read in username/status dictionary
usersf= File.open("users", "a+").each { |line|
	particip = line.split()
	if dict.has_key?(particip[0]) == false
		dict [particip[0]] = particip[1]
	end
	#User dictionary now includes all existing participants
}

id_counterf = File.open("id counter", "r")
id_counters = id_counterf.readline
id_counter = Integer(id_counters)
id_counterf.close

search = Twitter::Search.new
search_terms = ["I", "me", "my", "myself"]
loc = Random.rand(3) 

if loc == 0
	#East - Virginia Beach, VA
	result = search.lang('en').geocode(36.8506,-75.9779,"450mi").containing(search_terms.join(" OR "))
elsif loc == 1
	#Midwest - Red Cloud, NE
	result = search.lang('en').geocode(40.0518,-98.3122,"700mi").containing(search_terms.join(" OR "))
elsif loc == 2
	#West - Fortuna, CA
	result = search.lang('en').geocode(40.3553,-124.0926,"600mi").containing(search_terms.join(" OR "))
end

result.each do |tweet|
	#if userlookup.has_key?(tweet.from_user) == false
	if dict.key(tweet.from_user) == nil
		#Check activity restraints
		stream = Twitter::Client.new
		opt = {}
		#Grab this many tweets from the user
		opt["count"] = 1 if $ENV == "test"
		opt["count"] = 50 if $ENV == "production"
		res = stream.user_timeline(tweet.from_user, opt)
		puts res.last.created_at
		tmp = res.last.created_at.split()
		m, d = tmp[1], tmp[2]
		if criteria(m,d) == 1
			#Add to dictionary
			dict[id_counter] = tweet.from_user
			usersf.write(id_counter.to_s + " " + tweet.from_user + "\n")
			statusf.write(id_counter.to_s + " new\n")
			streamf = File.new("../user_data/"+id_counter.to_s,"w")
			res.each do |old_tweet|
				line = old_tweet.text + "\n-----------------\n"
				streamf.write(line)
			end
			#TODO identified particip ID
			streamf.close
			id_counter += 1
		end
		
	else
		#what to do if user exists
		puts "got a repeater doc!"
	end
end
id_counterff = File.open("id counter", "w")
id_counterff.write(id_counter.to_s)
id_counterff.close
usersf.close
statusf.close
#TODO write to log file search complete
