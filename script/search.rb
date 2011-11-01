require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'

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


search = Twitter::Search.new
search_terms = ["#latfh"] 
result = search.lang('en').geocode(41,-74,"250mi").containing(search_terms.join(" OR "))
result.each do |tweet|
	if dict.has_key?(tweet.from_user) == false
		#Check activity restraints
		stream = Twitter::Client.new
		opt = {}
		opt["count"] = 10
		res = stream.user_timeline(tweet.from_user, opt)
		puts tweet.from_user
		puts res.last.created_at
		#Dir.mkdir("user_data") unless Dir.exists?("user_data")
		#streamf = File.new("user_data/"+tweet.from_user,"w")
		#res.each do |old_tweet|
			#line = old_tweet.text + "\n"
			#streamf.write(line)
		#end
		#streamf.close
		#Add to dictionary
		dict[tweet.from_user] = "new"
		usersf.write(tweet.from_user + " new\n")
	else
		#what to do if user exists
	end
end

usersf.close