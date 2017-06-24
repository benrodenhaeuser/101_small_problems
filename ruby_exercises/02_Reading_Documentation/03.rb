s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect # => %w[abc, def, ghi, ...] (default: split on whitespace)
puts s.split(',').inspect # => ["abc def ghi,jkl mno pqr", "jkl mno pqr", "stu vwx yz" ] ("," is the delimiter)
puts s.split(',', 2).inspect # => ["abc def ghi,jkl mno pqr", "jkl mno pqr,stu vwx yz" ] ("at most two fields")

# the third line effectively means: "split at the first comma"
