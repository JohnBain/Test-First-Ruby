class Integer 		

	def length
		 Math.log10(self).to_i + 1       
	end

	#This returns the length of an integer as if it were a string.

	def split
		arr = []
		x = self.to_s
		y = x.split(//)
		y.each do |x|
			arr << x.to_i
		end
		arr
	end

	#Adds a split method to Integer.

	def read (integer)		#Integer is a misnomer since this method accepts both integers and arrays
		hbasic= {0 => "zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}

		hteen= {10=>"ten",11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}

		hdec= {20=>"twenty", 30=>"thirty", 40=>"forty", 50=>"fifty", 60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety"}

		hcomb= {2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"}

		#Hashes end.
		#Begin rules.

		minorstring = ' '
		if integer.length == 3
			x = integer

			if x[0] == 0
				if x[1] == 0
					if x[2] == 0
						nil
					else
						minorstring << hbasic [x[2]]
					end
					
				elsif x[1] == 1
					teen = x[1] * 10 + x[2]
					minorstring << hteen[teen]
				else
					minorstring << hcomb[x[1]] + " "
					if x[2] == 0
						nil
					else
						minorstring << hbasic[x[2]]
					end
				end

			else	# If x[0] is not 0, do the following.
				minorstring << hbasic[x[0]] + " hundred "

				if x[1] == 0
					if x[2] == 0	#If the following two numbers are 0, return nil
						nil
					else
						minorstring << hbasic [x[2]]
					end
				elsif x[1] == 1
					teen = x[1] * 10 + x[2]
					minorstring << hteen[teen]
				else
					minorstring << hcomb[x[1]] + " "
					if x[2] == 0
						nil
					else
						minorstring << hbasic[x[2]]
					end
				end
			end

		elsif integer.length == 2
			x = integer
			if x[-2] == 0
				minorstring << hbasic[x[-1]]
			elsif x[-2] == 1
				teen = x[-2] * 10 + x[-1]
				minorstring << hteen[teen]
			else
				minorstring << hcomb[x[-2]] + " "
				if x[-1] == 0
					nil
				else
					minorstring << hbasic[x[-1]]
				end
			end

		elsif integer.length == 1
			minorstring << hbasic[integer[0]]
		end



		minorstring.strip
	end






	def in_words

		num = self.split		#Turns self into an array. We then analyze them with our read method which only works with arrays of length 3 or less.

		finalstring = ' '

		if self == 0 
			finalstring << 'zero'
		elsif self <= 999
			finalstring << read(num)
		elsif self <= 9999
			x = num
			num1 = x[0]
			num2 = [x[1], x[2], x[3]]
			finalstring << read(num1) + " thousand "
			finalstring << read(num2)		
		elsif self <= 99999 # Ten Thousands
			x = num
			num1 = [x[0], x[1]]
			num2 = [x[2], x[3], x[4]]
			finalstring << read(num1) + " thousand "
			finalstring << read(num2)
		elsif self <= 999999 	# Hundred Thousands
			x = num
			num1 = [x[0], x[1], x[2]]
			num2 = [x[3], x[4], x[5]]
			finalstring << read(num1) + " thousand "
			finalstring << read(num2)
		elsif self <= 9999999               # Millions
			num1 = num[0]
			num2 = [num[1], num[2], num[3]]
			num3 = [num[4], num[5], num[6]]
			finalstring << read(num1) + " million "
			if num2 == [0, 0, 0]
				nil
			else
				finalstring << read(num2) + " thousand "			#Workaround for when the number is all 0's
			end
			finalstring << read(num3)
		elsif self <= 99999999 				# Ten millions
			num1 = [num[0], num[1]]
			num2 = [num[2], num[3], num[4]]
			num3 = [num[5], num[6], num[7]]
			finalstring << read(num1) + " million "
			if num2 == [0, 0, 0]; nil; else; finalstring << read(num2) + " thousand "; end
			finalstring << read(num3)
		elsif self <= 999999999 	#Hundred Millions
			num1 = [num[0], num[1], num[2]]
			num2 = [num[3], num[4], num[5]]
			num3 = [num[6], num[7], num[8]]
			finalstring << read(num1) + " million "
			if num2 == [0, 0, 0]; nil
			else; finalstring << read(num2) + " thousand "; end
			finalstring << read(num3)
		elsif self <= 9999999999    # Billions
			num1 = num[0]
			num2 = [num[1], num[2], num[3]]
			num3 = [num[4], num[5], num[6]]
			num4 = [num[7], num[8], num[9]]
			finalstring << read(num1) + " billion "
			if num2 == [0,0,0]; nil; else; finalstring << read(num2) + " million "; end
			if num3 == [0,0,0]; nil; else; finalstring << read(num3) + " thousand "; end
			finalstring << read(num4)
		elsif self <= 99999999999 # Ten Billions
			num1 = [num[0], num[1]]
			num2 = [num[2], num[3], num[4]]
			num3 = [num[5], num[6], num[7]]
			num4 = [num[8], num[9], num[10]]
			finalstring << read(num1) + " billion "
			if num2 == [0,0,0]; nil; else; finalstring << read(num2) + " million "; end
			if num3 == [0,0,0]; nil; else; finalstring << read(num3) + " thousand "; end
			finalstring << read(num4)
		elsif self <= 999999999999 # Hundred Billions
			num1 = [num[0], num[1], num[2]]
			num2 = [num[3], num[4], num[5]]
			num3 = [num[6], num[7], num[8]]
			num4 = [num[9], num[10], num[11]]
			finalstring << read(num1) + " billion "
			if num2 == [0,0,0]; nil; else; finalstring << read(num2) + " million "; end
			if num3 == [0,0,0]; nil; else; finalstring << read(num3) + " thousand "; end
			finalstring << read(num4)
		elsif self <= 9999999999999 # Trillions
			num1 = num[0]
			num2 = [num[1], num[2], num[3]]
			num3 = [num[4], num[5], num[6]]
			num4 = [num[7], num[8], num[9]]
			num5 = [num[10], num[11], num[12]]
			finalstring << read(num1) + " trillion "
			if num2 == [0,0,0]; nil; else; finalstring << read(num2) + " billion "; end
			if num3 == [0,0,0]; nil; else; finalstring << read(num3) + " million "; end
			if num4 == [0, 0, 0]; nil; else; finalstring << read(num4) + " thousand "; end
			finalstring << read(num5)
		end

		return finalstring.strip

	end

end
