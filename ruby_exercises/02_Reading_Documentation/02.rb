# use Array#insert to insert 5, 6 and 7 between c and d in array below:

# signature of insert: insert(index,obj...) -> ary
# so we need to put the index where we want to insert as the first argument to insert
# second argument will be the number we want to insert
# and the method call will change the original array

a = %w(a b c d e)
a.insert(3, 7)
a.insert(3, 6)
a.insert(3, 5)
p a

# incidentally, we can do this in one line, because the method accepts supplying a number of arguments:
a = %w(a b c d e)
a.insert(3, 5, 6, 7)
