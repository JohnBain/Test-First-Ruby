def translate (phrase)
	vowels = %w{a e y i o u}
    consonants = %w{b c d f g h j k l m n p q r s t v w x z}
    


    x = phrase.split(" ").map do |word|
        if vowels.include?(word[0])
            reject = ""
    		word + "ay"
    	elsif consonants.include?(word[0])
            vowels.pop if word[0] == "q" or word[1] == "q"  #If q is used, "u" is no longer a vowel for purposes of our until loop.
            reject = ""

            i = 0
            until vowels.include?(word[i])
                reject << word.slice!(0)        
            end

            vowels << "u" if vowels[-1] != "u"      #Adds "u" if it's been removed.

            word + reject + "ay"
        end

        
    end

   return x.join(" ")

end