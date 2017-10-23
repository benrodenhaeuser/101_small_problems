module RunLengthEncoding
  def self.encode(string)
    chunks_to_encode(string).map do |chunk|
      if chunk.length > 1
        "#{chunk.length}#{chunk[1]}"
      else
        "#{chunk[0]}"
      end
    end.join
  end

  def self.chunks_to_encode(string)
    string.chars.each_with_object([]) do |char, obj|
      if obj == []
        obj << [char]
      elsif obj.last.last == char
        obj.last << char
      else
        obj << [char]
      end
    end
  end

  def self.decode(string)
    chunks_to_decode(string).map do |chunk|
      if chunk.length > 1
        chunk[-1] * chunk[0..-2].to_i
      else
        chunk
      end
    end.join
  end

  def self.chunks_to_decode(string)
    string.scan(/[0-9]*[A-Z\s]/i)
  end
end

module BookKeeping
  VERSION = 3
end
