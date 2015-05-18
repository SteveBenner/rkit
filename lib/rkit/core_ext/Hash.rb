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

  # todo: create methods :map_keys and :map_keys!

  # Returns all key/value pairs of a Hash for which the key exists in given Array
  #
  # @param [Array] keys Keys to select from self, for which key/value pairs are returned
  # @return [Hash] A Hash containing all key/value pairs whose key is in given Array
  #
  # todo: write tests
  def subset(keys)
	  # todo: find the most efficient means of doing this
	  self.select { |k, v| keys.include? k }
  end
end