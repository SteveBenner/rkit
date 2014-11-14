# Rkit is my personal toolkit for Ruby development
module Rkit
	VERSION = '0.0.1'

	module ::Kernel
		# Loads all Ruby files that are direct children of given directory
		#
		# @param [String, Pathname] dir Directory name
		def load_all(dir)
			Dir.glob(File.join dir, '*.rb').each { |file| load file }
		end
	end
end