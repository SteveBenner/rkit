class Pathname
	def to_a
		self.to_path.split File::SEPARATOR
	end

	def [](key)
		self.to_a[key]
	end

	def is_dotfile?
		self.basename.to_s[0] == '.' ? true : false
	end

	# todo: create in-place method as attempted below
	# def sub_ext!(ext)
	# 	self = self.sub_ext ext
	# end
end