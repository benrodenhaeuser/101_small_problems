module ETL
  def self.transform(num_to_chars)
    num_to_chars.each_with_object({}) do |(num, chars), char_to_num|
      chars.each do |char|
        char_to_num[char.downcase] = num
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
