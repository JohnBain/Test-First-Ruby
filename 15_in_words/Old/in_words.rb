class Fixnum

	def in_words

	finalstring = ' '

	hbasic= {0 => "zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}

	hteen= {10=>"ten",11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}

	hdec= {20=>"twenty", 30=>"thirty", 40=>"forty", 50=>"fifty", 60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety"}

	hcomb= {2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"}

	num = self.to_s

	#--One-digits
	if num.length == 1
		finalstring << hbasic[num.to_i]
	end

	#--Tens
	if num.length == 2
		numsarray = num.split(//).map {|i| i.to_i} # We're working with integers now
		if numsarray[0] == 1
			finalstring << hteen[num.to_i]
		else
			if numsarray[-1].to_i == 0
			finalstring << hdec[num.to_i]
			else
			finalstring << hcomb[numsarray[-2].to_i] + " "
			finalstring << hbasic[numsarray[-1].to_i]
			end
		end
	end

	#--Hundreds
	if num.length == 3
		numsarray = num.split(//).map {|i| i.to_i}
		finalstring << hbasic[numsarray[0]] + " hundred " 
		if numsarray[-2] == 1
			arr = (numsarray[-2] * 10) + numsarray[-1]
			finalstring << hteen[arr]
		elsif numsarray[-1] != 0 && numsarray[-2] != 0
				finalstring << hcomb[numsarray[-2].to_i] + " "
				finalstring << hbasic[numsarray[-1].to_i]
		end
	end

	#--Thousands and ten thousands
	#--Should change to work with hundred thousands here although it is not part of the spec
	if num.length == 4 or num.length == 5
		numsarray = num.split(//).map {|i| i.to_i}
		if num.length == 4
			num = numsarray[0]
			arr = [numsarray[1], numsarray[2], numsarray[3]]			
			finalstring << hbasic[num] + " thousand "				#Splits num into two parts
		elsif num.length == 5
			num = [numsarray[0], numsarray[1]]
			arr = [numsarray[2], numsarray[3], numsarray[4]]		#Splits num into two parts
				if num[-1] == 0
					finalstring << hdec[num[-1].to_i]
				else
					finalstring << hcomb[num[0].to_i] + " "
					finalstring << hbasic[num[-1].to_i] + " thousand "
				end
		end
		#This is where we describe what "arr" does
		if arr[-2] == 1
			/arr2 = (arr[-2] * 10) + arr[-1]/
			/Make sure you change it up so it can read numbers like 117/
			finalstring << hteen[arr]
		elsif arr[-1] != 0 && numsarray[-2] != 0
				finalstring << hbasic[arr[-3].to_i] + " hundred "
				finalstring << hcomb[arr[-2].to_i] + " "
				finalstring << hbasic[arr[-1].to_i]
		end

	end

	#--Millions and ten millions
	if num.length == 7 or num.length == 8
		numsarray = num.split(//).map {|i| i.to_i}
		if num.length == 7
			firstdigits = numsarray[0]
			arr = [numsarray[1], numsarray[2], numsarray[3]]
			arr2 = [numsarray[4], numsarray[5], numsarray[6]]
			finalstring << hbasic[firstdigits[num]] + " million "


		elsif num.length == 8
			#Code goes here
			arr = [numsarray[2], numsarray[3], numsarray[4]]
			arr2 = [numsarray[5], numsarray[6], numsarray[7]]
		end

	end

	finalstring.strip


	end
		
	def length
		 Math.log10(self).to_i + 1       
	end

end

/def read (integer)
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
			x = integer.split
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
			minorstring << hbasic[integer]
		end



		minorstring.strip
	end/