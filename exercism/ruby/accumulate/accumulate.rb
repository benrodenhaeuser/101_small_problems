module Enumerable
  def accumulate
    collection = []
    each do |elem|
      collection << yield(elem)
    end
    collection
  end
end

module BookKeeping
  VERSION = 1
end
