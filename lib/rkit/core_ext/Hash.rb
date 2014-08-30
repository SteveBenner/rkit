class Hash
	# Returns a copy of self, with values replaced by the result of running
	# them through given *block*.
	#
	# @yield [value] Each Hash value is passed to the given *block*, and the
	#   result is used as a replacement value in the generated Hash.
	# @raise [ArgumentError] *Hash#map_values must be passed a block.*
	#
	def map_values(&block)
		if block_given?
			Hash[self.map { |key, value| [key, yield(value)] }]
		else
			raise ArgumentError, 'Hash#map_values must be passed a block.' unless block_given?
		end
	end
	alias_method :vmap, :map_values

	# Replaces each value in self with the result of running it through
	# given *block*.
	#
	# @yield [value] Each Hash value is replaced by the result of running
	#   it through given *block*.
	# @raise [ArgumentError] *Hash#map_values must be passed a block.*
	#
	def map_values!(&block)
		if block_given?
			self.each_pair { |key, value| self[key] = yield value }
		else
			raise ArgumentError, 'Hash#map_values! must be passed a block.' unless block_given?
		end
	end
	alias_method :vmap!, :map_values!
end