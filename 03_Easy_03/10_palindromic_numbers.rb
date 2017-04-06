def palindromic_number?(number)
  number_string = number.to_s
  number_string == number_string.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
