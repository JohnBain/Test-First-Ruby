class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		hours = @seconds / 3600
		minutes = (@seconds - (hours * 3600)) / 60
		seconds = @seconds - (hours * 3600) - (minutes * 60)
		x = Time.utc(1970, 1, 1, hours, minutes, seconds)
		x.strftime "%H:%M:%S"
	end
end