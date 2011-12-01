def criteria(tmonth, tday)
	months = { "Jan" => 1, "Feb" => 2, "Mar" => 3, "Apr" => 4, "May" => 5, "Jun" => 6, "Jul" => 7, "Aug" => 8, "Sep" => 9, "Oct" => 10, "Nov" => 11, "Dec" => 12}
	tyearday = (months[tmonth]-1)*30 + tday.to_i
	puts (Time.now.yday - tyearday) % 365
	if (Time.now.yday - tyearday) % 365 < 60
		puts "user qualifies"
		return 1
	else
		puts "found a lame one"
		return 0
	end
	puts "there was an error"
	return -1
end
