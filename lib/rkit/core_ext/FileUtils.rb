module FileUtils
	# Increments a given filename
  def fname_incr(fname)
    !File.exists?(fname) ?
      fname :
      /([0-9]+)\./.match(fname) ?
        fname_incr(fname.sub(/([0-9]+)/) { |m| (m.to_i+1).to_s }) :
        fname_incr(fname.sub(/[^\.]*/) { |m| m+'1' })
  end
end