def step(start_val, end_val, stepper)
  current = start_val
  while current <= end_val
    yield(current)
    current += stepper
  end
  nil
end

# example:

step(1, 10, 3) { |value| puts "value = #{value}" }
#
# value = 1
# value = 4
# value = 7
# value = 10
