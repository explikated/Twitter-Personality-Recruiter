def message(user)
	#adding a really useful comment
	n = Random.rand(3)
	doc = n.to_s + " " + user + "\n"
	File.open("user messages.txt", 'a') {|f| f.write(doc) }

	#Random number generator
	if n == 0
		"@"+"#{user} Researchers at Olin College are studying personality on Twitter and we'd like your help. Visit " + study_url(user)
	elsif n == 1
		"@"+"#{user}, We'd like your help in the first study about Twitter and Personality. Learn more and participate at " + study_url(user)
	elsif n == 2
		"@"+"#{user} Interested in how others see your tweets? Participate in the first study of Twitter and Personality. " + study_url(user)
	end
	
end

def study_url(user)
	"http://olinpsychology.com/new_participant/"+"#{user}"
end
