class Fixnum

	def length
		 Math.log10(self).to_i + 1       
	end

	#This returns the length of a Fixnum as if it were a string.

	def split
		arr = []
		x = self.to_s
		y = x.split(//)
		y.each do |x|
			arr << x.to_i
		end
		arr
	end

	#Adds a split method to Fixnum.

	def read (*integer)
		hbasic= {0 => "zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}

		hteen= {10=>"ten",11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}

		hdec= {20=>"twenty", 30=>"thirty", 40=>"forty", 50=>"fifty", 60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety"}

		hcomb= {2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"}

		#Hashes end.

		minorstring = ' '
		if integer.length == 3
			x = integer.split
			#I would just take off the first digit and feed the 2 digits remaining back to read, but Ruby 2.0 doesn't allow instance (@) variables so we're stuck taking the long way.

			if x[0] == 0
				if x[1] == 0
					minorstring << hbasic [x[2]]
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
			else

				minorstring << hbasic[x[0]] + " hundred "

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

		num = self.split

		finalstring = ' '

		#Begin program.

		if self == 0 
			finalstring << 'zero'
		elsif self <= 999
			finalstring << read(num)
		elsif self <= 9999
			x = num.split
			num1 = x[0]
			num2 = [x[1], x[2], x[3]]
			finalstring << read(num1) + " thousand "
			finalstring << read(num2)
		end














		#End of the hard part.

		return finalstring.strip

	end

end