module Year
  def self.leap?(year)
    year % 400 == 0 || (year % 100 != 0 && year & 4 == 0)
  end
end

# A leap year occurs:
# on every year that is evenly divisible by 4
# except every year that is evenly divisible by 100
# unless the year is also evenly divisible by 400

module BookKeeping
  VERSION = 3
end 
