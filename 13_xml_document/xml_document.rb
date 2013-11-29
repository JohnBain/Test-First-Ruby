class XmlDocument

def initialize (indent = false)
	@indent = indent
	@indent_level = 0
end


def method_missing (name, *args, &block)
	text = " "
	text << "<" + name.to_s
	if args.length > 0			
		args[0].each do |k,v|
			text << " #{k}='#{v}'"; end
	end


	if block_given?
			@indent_level += 1
			text << ">"	

			text << "\n" + " " * @indent_level * 2 if @indent
			text << yield					

			@indent_level -= 1		
			text << " " * @indent_level * 2 if @indent
			text << "</#{name}>" 
			text << "\n" if @indent

	else
		text << "/>"
		text << "\n" if @indent
	end

		if @indent 
			text[0] = ''
			return text
		else

		return text.strip

		end
end

end
