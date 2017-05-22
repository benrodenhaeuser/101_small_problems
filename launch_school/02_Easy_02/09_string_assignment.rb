name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# =>
# BOB
# BOB

# In line 1, the String object 'Bob' is assigned to name
# In line 2, the *same* object is assigned to save_name
# So now both name and save_name reference that same object.
# In line 3, the String object to which both name and save_name point point
# is mutated.
# So we are really printing the same object twice on line 4.

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# This is different, because on the third line of this fragment, we reassign
# name to 'Alice'. So name and save_name do not point to same obj anymore.
