require 'rubygems'
require 'net/http'
require 'net/https'
require 'twitter'
require './auth.rb'
require './env.rb'

dict = {}
sends = []

usersf = File.open("users", "a+").each do |line|
	particip = line.split()
	dict[particip.first] = particip.last
	sends << particip.first if particip.last == "new"
end
usersf.truncate(0)

def message(user)
	"Hi #{user}!"
end

sends.each do |user|
	Twitter.update(message(user)) if $ENV == 'production'
	puts message(user) if $ENV == 'test'
	dict[user] = "messaged-#{Time.now.to_s.split.join("/")}"
	usersf.puts("#{user} #{dict[user]}")
	sleep 20*60 + (rand(20) - 5)*20 if $ENV == 'production' #wait 15-30 minutes before sending next one
end

usersf.close
