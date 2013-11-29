class Array

def sum
	self.inject(0) {|x, y| x + y}
end

def square
	self.map {|x| x * x}
end

def square!
	self.map! {|x| x * x}
end

end