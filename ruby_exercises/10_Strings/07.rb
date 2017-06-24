greeting = 'Hello!'
greeting.delete!("Hello!") << "Goodbye!"
puts greeting

greeting = 'Hello!'
greeting.gsub!('Hello','Goodbye')
puts greeting
