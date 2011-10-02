require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'
require './auth.rb'
require './env.rb'
require './message.rb'

dict = {}
sends = []

usersf = File.open("users", "a+").each do |line|
	particip = line.split()
	dict[particip.first] = particip.last
	sends << particip.first if particip.last == "new"
end
usersf.truncate(0)

sends.each do |user|
	Twitter.update(message(user)) if $ENV == 'production'
	puts message(user) if $ENV == 'test'
	dict[user] = "messaged-#{Time.now.to_s.split.join("/")}"
	usersf.puts("#{user} #{dict[user]}")
	sleep (5 + rand(10))*60 if $ENV == 'production' #wait 5-15 minutes before sending next one
end

usersf.close
