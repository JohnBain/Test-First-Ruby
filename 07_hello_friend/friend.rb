class Friend
	def greeting(x=nil)
		if x
		"Hello, " + x.to_s + "!"
	else
		"Hello!"
	end
end
end