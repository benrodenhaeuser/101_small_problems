class Integer

  CONVERSIONS = {
    1 => 'I',
    5 => 'V'
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman
    CONVERSIONS[1]
  end
end


=begin

Examples:

1 I
2 II
3 III
4 IV
5 V
6 VI
7 VII
8 VIII
9 IX
10 X


1989 ==> 1000 + 900 + 80 + 9

1989 / 1000 = 1
1989 % 1000 = 989

----

remaining = number %
current = number - remainder




=end
