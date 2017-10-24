class Series
  def initialize(string_of_digits)
    @digits = string_of_digits.split('')
  end

  def slices(length_of_slice)
    raise ArgumentError if length_of_slice > @digits.length

    @digits.each_cons(length_of_slice).map do |slice|
      slice.join
    end
  end
end
