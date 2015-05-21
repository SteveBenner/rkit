module FileUtils
	# Like String#gsub but for files
	# todo: review this code
	def fgsub(filename, search_expression, replaceement)
		IO.write(filename, File.open(filename) do |f|
       if (search_expression.is_a? Hash) then
         text = f.read
         search_expression.size.times do |s, r|
           text.gsub(s, r.to_s)
         end
       else
         f.read.gsub(search_expression, replaceement.to_s)
       end
     end
		)
	end

	# Increments a filename sequentially, in order to avoid filename conflicts
	def fname_incr(fname)
		!File.exists?(fname) ?
			fname :
			/([0-9]+)\./.match(fname) ?
				fname_incr(fname.sub(/([0-9]+)/) { |m| (m.to_i+1).to_s }) :
				fname_incr(fname.sub(/[^\.]*/) { |m| m+'1' })
	end
end