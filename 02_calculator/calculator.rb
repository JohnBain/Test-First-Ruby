def add (x,y)
	x + y
end

def subtract (x,y)
	x - y
end

def sum (*args)
	a = Array.new(*args)
	sum = 0
	a.each {|x| sum += x}
	return sum
end

def multiply (args)
	sum = 1
	args.each {|x| sum *= x}
	return sum
end

def power (x, y)
	z = x ** y
	return z
end

def factorial(n)
	sum = 1
	until n == 0
		sum *= n
		n -= 1
	end
	return sum
end
