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

class Time
	# Same as Time::at except the input is truncated to 10 digits, allowing
	# extra long timestamps (such as those used by SQL) to be provided.
	#
	# @param [Integer, String] timestamp Unix timestamp of any length (seconds since epoch)
	# @return [Time] New Time object based on given timestamp
	#
	def self.from_sql_timestamp(timestamp)
		Time.at timestamp.to_s[0..9].to_i
	end
end