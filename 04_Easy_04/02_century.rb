# the method `century` takes a year (integer) and returns the century of that year.
# centuries begin in the years that start with 01.
# 20th century: 1902-2000

# endings: X1st, X2nd, X3rd, XYth (X possibly empty, Y in (4..9) or Y == 0)

# approach
# how would we want to store the (types of) endings?
# how should the conversion between years and endings go, using types of endings appropriately
# Presumably, it will be useful to have numbers as keys, and endings, as values.

# how do we determine the "century number" (without the ending) given the year?
# a century is a hundred years (e.g. from 1 to 100).
# is there a connection between the number of digits in the year and the century?
# to some extent there is:
# -- up to 3 digits year => one digit century
# -- 4 digits year => two digits century
# -- 5 digits year => three digits century

# which digits decide about the century?
# for an n-digit century, it's the first n digits
# (the years that end in 0 are special)

endings = {
  0 => 'th'
  1 => 'st',
  2 => 'nd',
  3 => 'rd',
  4 => 'th',
  5 => 'th',
  6 => 'th',
  7 => 'th',
  8 => 'th',
  9 => 'th',
}

(1..100) => 1st century
(101..200) => 2nd century


def century(year)

end

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
