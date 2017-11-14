# Group 1
def check_return_with_proc
  my_proc = proc { return } # returns from the calling method
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# ^ using a return in a normal proc defined in a method will return from the method during whose execution the proc was called

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

# check_return_with_proc_2(my_proc)

# ^ this will throw an error, because the proc attempts to return from the top level of the program

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return } # merely returns to the execution point where lambda was called
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# ^ using a return in a lambda defined in method will return to the point at which the lambda was called

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# ^ using a return in a lambda defined outside method will also return to the point at which the lambda was called

# Group 5
def block_method_3
  yield
end

# block_method_3 { return }

# LocalJumpError: block tries to return from top level


# Overall observations:

# Useage of return keyword in proc: return to *where the proc was defined* (in terms of "level")
# Useage of return keyword in block: return to *where the block was defined* (in terms of "level")
# Useage of return keyword in lambda: return to the line after the call

# Group 6

def method_that_takes_block
  yield
end

def another_method
  method_that_takes_block { return }
  puts "This will never be printed"
end

another_method
puts "This will be printed, of course."

# => should be fine
