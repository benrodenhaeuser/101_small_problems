module PhoneNumber
  N = %w[2 3 4 5 6 7 8 9]

  def self.clean(number)
    digits = number.gsub(/[^0-9]/, '')

    return nil if ![10, 11].include?(digits.length)

    if digits.length == 11
      return nil unless digits[0] == '1'
      digits = digits[1..-1]
    end

    return nil unless N.include?(digits[0]) && N.include?(digits[3])

    digits
  end

end

module BookKeeping
  VERSION = 2
end
