a = %w(a b c d e)
puts a.fetch(7) # IndexError
puts a.fetch(7, 'beats me') # 'beats me' (default supplied for invalid indices)
puts a.fetch(7) { |index| index**2 } # 49 (block supplied for invalid args)
