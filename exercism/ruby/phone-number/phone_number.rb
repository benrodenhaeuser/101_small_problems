module PhoneNumber
  N = %w[2 3 4 5 6 7 8 9]

  def self.clean(number)
    digits = number.gsub(/[^0-9]/, '')

    if digits.length == 11 && digits[0] == '1'
      digits = digits[1..-1]
    end

    if digits.length == 10
      return digits if N.include?(digits[0]) && N.include?(digits[3])
    end
  end
end

module BookKeeping
  VERSION = 2
end


# p PhoneNumber.clean('12234567890')
