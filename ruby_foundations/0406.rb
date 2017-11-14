my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # prints out class name and object id
puts my_proc.class # Proc
my_proc.call # thing is nil here.
my_proc.call('cat')

# Can create proc with `proc` keyword or with `Proc.new`
# procs are instances of Proc class
# Can call proc with any number of params (too few, too many) – they have variable arity

puts

my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class # Proc
my_lambda.call('dog') # This is a dog
# my_lambda.call # "wrong number of arguments"
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } # uninitialized constant Lambda

# Lambdas are a specific kind of proc. There is no separate class Lambda
# Lambdas care about the number of params, i.e., arity is enforced strictly

puts

def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # seal is not yielded to the block, actually
# block_method_1('seal') # error – no block given (LocalJumpError)

# a block does not enforce the arguments passed to it to be the same number as the number of parameters
# method that yields needs to have a block passed

puts

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # fine
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # seal is nil
end
# block_method_2('turtle') { puts "This is a #{animal}."} # animal not in scope
# animal variable does not exist in scope of block
