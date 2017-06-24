array1 = [1, 5, 9]
array2 = [1, 9, 5]

p array1 == array2 # => false: so they are not the same (in the sense of containing the same elements)

p array1.object_id == array2.object_id # false: they are also not the same on the object-level

array3 = [1, 5, 9]
array4 = [1, 5, 9]

p array3 == array4 # => true: so they are the same (in the sense of containing the same elements)

p array1.object_id == array2.object_id # false: they are not the same on the object-level
