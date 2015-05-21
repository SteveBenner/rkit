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

  # Modifies the values of a Hash in place as in Array#collect!
  # WARNING!!! INSECURE!!! Arbitrary code may be executed via eval
  #
  # @param function [Symbol] Function to pass each value to for replacement
  #
  def each_value!(function)
	  self.each_value {|key, val| self[key] = eval "#{function.to_s}(#{val})"}
  end

  # Removes all nil values from Hash recursively
  #
  # @return [Hash] Self, with all keys with a value of nil removed
  #
  def recursive_compact!
	  inject({}) do |new_hash, (k, v)|
		  unless v.nil?
			  new_hash[k] = v.class == Hash ? v.recursive_compact! : v
		  end
		  new_hash
	  end
  end

  # Traverses a nested structure, returning only the first element of collections
  def shallow_traverse
	  self.dup.reduce({}) do |h, (k, v)|
		  h[k] = case v.class
			         when Hash then v.shallow_traverse
			         when Array then v.first.shallow_traverse
			         else v
		         end
		  h
	  end
  end

  # Recursively merges two hashes, without merging nils
  def recursive_merge(other_hash={})
	  merge(other_hash) do |key, oldval, newval|
		  if oldval.is_a? Hash
			  oldval.recursive_merge(newval)
		  else
			  newval.nil? ? oldval : newval
		  end
	  end
  end

  # Recursively merges two hashes in place (destructive), without merging nils
  def recursive_merge!(other_hash={})
	  merge!(other_hash) do |key, oldval, newval|
		  if oldval.is_a? Hash
			  oldval.recursive_merge(newval)
		  else
			  newval.nil? ? oldval : newval
		  end
	  end
  end

  # not if working...
  def reverse_recursive_merge(other_hash={})
	  other_hash.recursive_merge(self)
  end

  # not if working...
  def reverse_recursive_merge!(other_hash={})
	  replace(reverse_recursive_merge(other_hash))
  end
end