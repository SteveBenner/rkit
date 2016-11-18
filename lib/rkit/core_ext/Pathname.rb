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

  # todo: document
  def flatten!(file_types)
    # todo
    # move all files of given types to top-level dir
    # delete any and all empty directories
  end

  # todo: create in-place method as attempted below
  # def sub_ext!(ext)
  #   self = self.sub_ext ext
  # end
end