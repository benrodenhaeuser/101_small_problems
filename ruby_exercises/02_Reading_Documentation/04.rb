require 'date'

# => look at Date::new to find out what to expect from the following puts statements!

puts Date.new # => "-4712-01-01" (!)
puts Date.new(2016) # => "2016-01-01"
puts Date.new(2016, 5) # => "2016-05-01"
puts Date.new(2016, 5, 13) # => "2016-05-13"
