class Book
attr_accessor :title

def title
	dont_cap = %w{the over and in of a an}
	words = @title.split(" ")
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

end

