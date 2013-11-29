def echo(x)
	return x
end

def Simon_says(x)
	echo x
end

def shout(x)
	echo x.upcase
end

def repeat(x, y=2)
	echo ([x] * y).join ' '
end

def start_of_word(x, y)
	echo x[0...y]
end

def first_word(x)
	z = x.split(" ")
	echo z[0]
end

def titleize(x)
	dont_cap = %w{the over and}
	words = x.split(" ")
	words.collect! do |word|
		if word == words[0]
			word.capitalize
		elsif dont_cap.include?(word)
			word
		else
			word.capitalize
		end
	end
	words.join(" ")
end
