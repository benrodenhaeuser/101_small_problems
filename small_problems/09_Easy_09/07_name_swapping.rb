=begin
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

=end

# my solution:

def swap_name(name_str)
  [name_str.split.last, ', ', name_str.split.first].join
end

# my solution is not DRY, because we have to split the string twice.
# while we could avoid this by assigning name_str.split to a variable,
# the instructor solution below is clearly better.

# instructor solution:

def swap_name(name)
  name.split(' ').reverse.join(', ')
end




p swap_name('Joe Roberts') == 'Roberts, Joe'
