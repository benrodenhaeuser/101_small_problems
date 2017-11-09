module BookKeeping
  VERSION = 1
end

module FlattenArray
  def self.flatten(array, flattened = [])
    array.each_with_object(flattened) do |elem|
      if elem.kind_of?(Array)
        flatten(elem, flattened)
      else
        flattened << elem unless elem.nil?
      end
    end
  end
end
