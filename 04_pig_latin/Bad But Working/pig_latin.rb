def translate(phrase)

    vowels = %w{a e y i o u}
    consonants = %w{b c d f g h j k l m n p q r s t v w x z}

    def phrase.to_a
    split(" ")
	end
	#This makes it so turning phrase into an array splits it on whitespace automatically.

	z_array = Array(phrase)
	#This array is an interim array we're just using for purposes of my if/else clause.
	final_array = Array.new
	#This is the final array we'll join to produce our translation at the end.

	if z_array.length > 1
		z_array.each do |x|
			y = x.scan(/\w/)
			#Feeds each individual part of our interim array into another interim array, y, which is split by character.
				if vowels.include?(y[0])
					final_array.push y.join + "ay"
				elsif consonants.include?(y[0])
					i = 0
					reject_con = Array.new
					until vowels.include?(y[i])
						if  y[i] == "q"
							vowels.pop
							#This covers the "qu" exception. 
							x = y.slice!(i)
							#Takes the sliced character and feeds it to x so we can push it to our rejected consonants array below.
							reject_con.push(x)
						else
						x = y.slice!(i)
						reject_con.push(x)
						end
					end
				final_array.push (y.join + reject_con.join + "ay")
				#Joins our interim array y, adds rejected consonants to the end, and then adds the requisite "ay". Then pushes it all to final_array for the translation.
				end
			end
			return final_array.join(" ")

	else
		#This is the same code as above, minus the "each" loop. This covers single-word strings.
		y = phrase.scan(/\w/)
				if vowels.include?(y[0])
					final_array.push y.join + "ay"
				elsif consonants.include?(y[0])
					i = 0
					reject_con = Array.new
					until vowels.include?(y[i])
						if y[i] == "q"
							vowels.pop
							x = y.slice!(i)
							reject_con.push(x)
						else
						x = y.slice!(i)
						reject_con.push(x)
						end
					end
				final_array.push (y.join + reject_con.join + "ay")
				end
				return final_array.join
	end

end