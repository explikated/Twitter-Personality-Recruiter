require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'
require './auth.rb'
require './env.rb'
require './message.rb'

#TODO write to log started messaging
user_dict = {}
status_dict = {}

sends = []

usersf = File.open("users", "a+").each do |line|
	particip = line.split()
	user_dict[particip.first] = particip.last
end

statusf = File.open("status", "a+").each do |line|
	idstatus = line.split()
	status_dict[idstatus.first] = idstatus.last
	sends << idstatus.first if idstatus.last == "new"
end
statusf.truncate(0)

sends.each do |id|
	user = user_dict[id]
	Twitter.update(message(user)) if $ENV == 'production'
	puts message(user) if $ENV == 'test'
	status_dict[id] = "messaged-#{Time.now.to_s.split.join("/")}"
	#TODO log user messaged
	sleep (1 + rand(10))*30 if $ENV == 'production' #wait 1-10 minutes before sending next one
end

#write new status dict
status_dict.each {|key, value| statusf.write("#{key} #{value}\n")}

statusf.close
usersf.close
#TODO log messaging complete
