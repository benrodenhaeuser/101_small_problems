=begin

You have a bank of switches before you numbered from 1 to 1000.
Each switch is connected to exactly one light that is initially off.
You walk down the row of switches, and turn every one of them on.
Then, you go back to the beginning and toggle switches 2, 4, 6, and so on.
Repeat this for switches 3, 6, 9, and so on, and keep going until you have
been through 1000 repetitions of this process.

approach:

- model the bank of switches with hash
- model on/off with true/false

{ 1 => false, 2 => false, 3 => false, ... }

- we need a way to express which switches we toggle in which round

first round: toggle 1, 2, 3, 4, ...
second round: toggle 2, 4, 6, 8, ...
third round: toggle 3, 6, 9, 12, ...
fourth round: toggle 4, 8, 12 ...

so we have a counter for the light we start at, let's call it start
each round, start is incremented by 1
and each round, we toggle all the multiples of start

multiple_of can be defined in terms of mod:

we will also want to toggle lights:
lights[number] = toggle(lights[number])

=end

def is_multiple_of?(number, other_number)
  other_number % number == 0
end

def toggle(boolean)
  !boolean
end

def repeated_toggling(lights)
  1.upto(1000) do |number|
    lights.each_key do |key|
      lights[key] = toggle(lights[key]) if is_multiple_of?(number, key)
    end
  end
end

lights = Hash.new
1.upto(1000) { |number| lights[number] = false }
repeated_toggling(lights)
on = lights.select { |key, value| value == true }.keys

puts "The following lights are on:"
puts "#{on}"
