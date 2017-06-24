a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    # a= 0    # this fixes the error. but puts a below still writes 7.
    a += b
  end
end

my_value(array)
puts a # a still is 7, but we get an error because we never defined a properly inside of my_value
