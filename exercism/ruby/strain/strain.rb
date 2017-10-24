module Enumerable

  def keep
    to_keep = []
    each do |elem|
      to_keep << elem if yield(elem)
    end
    to_keep
  end

  def discard
    to_keep = []
    each do |elem|
      to_keep << elem unless yield(elem)
    end
    to_keep
  end

end
