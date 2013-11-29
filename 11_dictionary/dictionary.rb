class Dictionary
	attr_accessor :entries

	def initialize (entries={})
		entries = Hash.new
		@entries = entries
	end

	def keywords
		z = Array.new
		@entries.each_key do |x|
			z.push x
		end
		z.sort!
		z
	end

	def add (string)
		if string.class == Hash
			string.each do |x,y|
			@entries[x] = y
		end
		elsif string.class == String
			@entries[string] = nil
		end
	end

	def include? (key)
		@entries.include?(key)
	end

	def find (query)
		found = {}

		@entries.each do |k, v|
			if /#{query}/ =~ k
				found[k] = v
			else
				nil
			end
		end
		found
	end

	def printable
		final = ' '
		@entries.sort_by {|k| k}.each do |k, v|
			final << %Q{[#{k}] "#{v}"\n}
		end
		final.strip
	end
end