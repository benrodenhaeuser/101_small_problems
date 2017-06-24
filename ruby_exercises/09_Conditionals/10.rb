stoplight = ['green', 'yellow', 'red'].sample

result = case stoplight
         when 'green'  then 'go'
         when 'yellow' then 'Slow down!'
         when 'red'    then 'Stop!'
         end

puts result
