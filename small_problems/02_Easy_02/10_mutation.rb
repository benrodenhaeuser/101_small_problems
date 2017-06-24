# What will the following code print, and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin

=> Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo

Why is that?

array1 holds a list of String objects as per line 3.
in line 4, we put these very same String objects in array2.

more precisely: an array in Ruby is essentially a list of references to objects.
in line 3, we create references to the same objects in array2.

So after line 5, we have array1[index].object_id == array2[index].object_id
for 0 <= index < array1.size

in line 6, the string objects that array1 holds are mutated.

but since array1 and array2 hold the very same objects,
line 6 will affect both arrays.

=end
