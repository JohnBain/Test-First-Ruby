class Temperature
	attr_accessor :options
	def initialize (options={})
		@options = options

		#While options is a hash, with a key and a value, it's still just one attribute of the class. We can't set them independently at this stage.
	end

	def in_fahrenheit
		options.each do |type, temp|
			if type == :c
				return 32 + (temp * 9.0/5)
			else
				return temp
			end
		end	
	end

	def in_celsius
		options.each do |type, temp|
			if type == :c
				return temp
			else
				return (temp - 32) * (5.0/9) 
			end
		end
	end

	def self.from_celsius(x)
		Temperature.new({:c => x})
	end

	def self.from_fahrenheit(x)
		Temperature.new({:f => x})
	end

	#These two are "factory methods". They create Temperature objects (in this case, with preset keys but variable values) for this particular instance of the class (that's why they're self methods.)

end

class Celsius < Temperature
	def self.new(x)
		Temperature.new(:c => x)
	end

end

class Fahrenheit < Temperature
	def self.new(x)
		Temperature.new(:f => x)
	end

	#These two modify the "new" method so that numbers inputted are turned into a format we can use for our Temperature methods.

end