class XmlDocument

def initialize (indent=0)
	@text = " "
	@indent = indent
end


def method_missing (name, *args, &block)
	@text << "<" + name.to_s 
	if args.length > 0			
		args[0].each do |k,v|				#args actually refers to an array of which the hash is only a part
			@text << " #{k}='#{v}'"; end
	end
	

	if block_given?
		@text << ">"
		if yield == yield.to_s
			@text << yield(block)
			@text << "</" + name.to_s + ">" #You must use to_s here as method-missing involves conversion of the first argument to a symbol!
		else
			@text << name.to_s
		end	
	else
		@text << "/>"
	end

	@text.strip
end

end