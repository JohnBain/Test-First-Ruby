class RPNCalculator
	attr_accessor :calculator

	def initialize (calculator=[])
		@calculator = calculator
	end

	def push (x)
		@calculator.push(x)
	end

	def plus
		raise "calculator is empty" if @calculator.empty?
		@calculator.push(@calculator.pop + @calculator.pop)
	end

	def minus
		raise "calculator is empty" if @calculator.empty?
		x = @calculator.pop
		y = @calculator.pop
		sum = y - x
		@calculator.push(sum)
	end

	def divide
		raise "calculator is empty" if @calculator.empty?
		x = @calculator.pop
		y = @calculator.pop
		sum = y.to_f / x
		@calculator.push(sum)
	end

	def times
		raise "calculator is empty" if @calculator.empty?
		@calculator.push(@calculator.pop * @calculator.pop)
	end


	def tokens (string)
		string.split.map do |x|
			if x =~ /\d/
				x.to_i
			else
				x.to_sym
			end
		end
	end

	def evaluate (string)
		placeholder = RPNCalculator.new
		tokens(string).each do |x|
			case x
			when :*
				placeholder.times
			when :+
				placeholder.plus
			when :/
				placeholder.divide
			when :-
				placeholder.minus
			else
			placeholder.push(x)
		end
		end
		placeholder.value
	end
		
	def value
		@calculator.last
	end
end