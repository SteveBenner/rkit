module YAML
	class IO
		# Scans a file and reports whether it contains any pound-based comments.
		#
		# @note This was imagined as a convenience method for working with YAML data,
		#   specifically to prevent the accidental destruction of comments in files,
		#   which may occur for instance when a YAML file containing comment is consumed
		#   and then overwritten by programmatically produced YAML data.
		# @return [true] if file contents include '#' comment
		# @return [false] if file contents do not include '#' comment
		def contains_comments?
			(/# [^'"]*$/.match self.read) ? true : false
		end
	end
end