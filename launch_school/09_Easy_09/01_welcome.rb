=begin

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title.

=end

def assemble_full_name(array)
  array.reduce { |full_name, component | full_name + ' ' + component }
end

def assemble_occupation(hash)
  hash[:title] + ' ' + hash[:occupation]
end

def greetings(array, hash)
  puts "Hello, #{assemble_full_name(array)}! Nice to have a #{assemble_occupation(hash)} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# this works, but it's needlessly complicated. The assemble_full_name method
# can be simplified to array.join(' '). Also, these might be circumstances
# where one method is enough :-)
