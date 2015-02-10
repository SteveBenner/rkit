# Copyright (C) 2015 Stephen C. Benner
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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