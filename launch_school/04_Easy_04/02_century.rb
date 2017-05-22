=begin

Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

REQUIREMENTS

- input: a positive integer (representing a year)
  - need to validate input? (negative integers? 0?) => NO
- return value: a string
  - begins with "century number"
  - ends with 'st'/'nd'/'rd'/'th' (as appropriate for number)
- a new century begins in years that end with 01. (example: 20th century is 1901-2000)

ANALYSIS

- two parts to the problem:
  1. convert from integer to century number
  2. determine ending appropriate for century number

PART I:

(1..100) => century number: 1
(101..200) => 2
(201..300) => 3
...
(901..1000) => 10th
(1001..1100) => 11th
...
(1901..2000) => 20th

**observation 1:**
given a year, we can read off the century number by considering the smallest integer x >= year such that x is evenly divisible by 100. the first digits of x determine the century number.

**observation 2:**
how many of the first digits of x do we need to consider?

x has 3 digits: first digit (example: year 201 => x = 300 => century 3)
x has 4 digits: first 2 digits (example: year 1604 => x = 1700 => century 17 )
x has 5 digits: first 3 digits (...)

so the rule is: cutting the last two digits off of x (as a string) yields century number


PART II:

**observation 3:** the appropriate ending for century number depends on the last digit of century number:

endings = {
  '0' => 'th'
  '1' => 'st',
  '2' => 'nd',
  '3' => 'rd',
  '4' => 'th',
  '5' => 'th',
  '6' => 'th',
  '7' => 'th',
  '8' => 'th',
  '9' => 'th',
}

==> so given century number, we can obtain the appropriate ending from last digit and the above hash.

Observation 3 is wrong! it's more complicated than that. 11 to 13 are exceptions.

CONDENSED OBSERVATIONS:

- given year `year`, consider smallest x >= year such that x % 100 == 0
- the century number is given by x without the last two digits (considered as string)
- the appropriate ending depends on the last digit of century number (Hash lookup)

ALGORITHM:

- input: positive integer `year`
- find smallest integer x >= 100 such that x % 100 == 0
  - loop
      first candidate is year itself
      if year is divisible by 100, then break out of loop, setting x = year
      else increment candidate by 1 and keep looping
- convert x to string
- century_number => remove the last two digits from x string
- century_ending => look up ending for last digit of century_number in hash
- return century_number + century_ending

=end

ENDINGS = {
  '0' => 'th',
  '1' => 'st',
  '2' => 'nd',
  '3' => 'rd',
  '4' => 'th',
  '5' => 'th',
  '6' => 'th',
  '7' => 'th',
  '8' => 'th',
  '9' => 'th'
}

def century(year)
  candidate = year
  turn_of_century = nil
  loop do
    if candidate % 100 == 0
      break turn_of_century = candidate
    else
      candidate += 1
    end
  end

  century_number = turn_of_century / 100

  if [11, 12, 13].include?(century_number % 100)
    century_ending = 'th'
  else
    century_ending = ENDINGS[century_number.to_s[-1]]
  end

  century_number.to_s + century_ending
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
