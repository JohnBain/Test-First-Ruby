def measure y = 1
	x = Time.now
	y.times do
		yield
	end
	time_elapsed = (Time.now - x)/y
	time_elapsed
end