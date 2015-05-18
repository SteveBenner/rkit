class Array
  # @return [Array] Two-member Array containing self evenly split into two sub-arrays
  # @example
  #   [1,2,3].halves    #=> [[1,2],[3]]
  #   [1,2,3,4].halves  #=> [[1,2],[3,4]]
  def halves
    [self[0..(self.size/2.0).round-1], self[(self.size/2.0).round..self.size]]
  end

  # @param [Integer] n Number of times to call zip upon self
  # @return [#zip] Self, after calling Array#zip upon self given number of times
  # @example
  #   [1,2,3].zipr    #=> [[[[1]]], [[[2]]], [[[3]]]]
  #   [1,2,3].zipr 1  #=> [[1], [2], [3]]
  def zipr(n = self.length)
    r = self
    n.times { r = r.zip }
    r
  end

  # @param [Array<Integer>] List of sizes of the partitions self will be subdivided into
  # @return [Object] Array containing self divided into one or more sub-arrays of size n
  # @example
  #   [1,2,3].subdv [1]      #=> [[1]]
  #   [1,2,3].subdv [3]      #=> [[1,2,3]]
  #   [1,2,3].subdv [1,2]    #=> [[1],[2,3]]
  #   [1,2,3].subdv [1,2]    #=> [[1],[2,3]]
  #   [1,2,3].subdv [1,1,1]  #=> [[1],[2],[3]]
  #   [1,2,3].subdv [1,2,1]  #=> [[1],[2,3],[]]
  def subdv(arr)
    arr.reduce([]) { |ret, n| ret << self.slice!(0..n-1) }
  end
end