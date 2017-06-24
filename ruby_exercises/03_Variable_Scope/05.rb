a = "Xyzzy"

def my_value(b)
  b = 'yzzyX' # this is reassignment! does not do anything to the string referenced by a
end

my_value(a)
puts a # => "Xyzzy"
