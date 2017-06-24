status = ['awake', 'tired'].sample

result =
  if status == 'awake'
    'be productive'
  else
    'go to sleep'
  end

puts result
