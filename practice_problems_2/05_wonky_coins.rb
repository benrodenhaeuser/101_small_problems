# Catsylvanian money is a strange thing: they have a coin for every
# denomination (including zero!). A wonky change machine in
# Catsylvania takes any coin of value N and returns 3 new coins,
# valued at N/2, N/3 and N/4 (rounding down).
#
# Write a method `wonky_coins(n)` that returns the number of coins you
# are left with if you take all non-zero coins and keep feeding them
# back into the machine until you are left with only zero-value coins.
#
# Difficulty: 3/5

=begin

approach:

1.) requirements/understanding

** "wonky change machine"
- given a coin with value N, the machine returns three coins with value N/2, N/3, N/4
- the machine rounds down, i.e., it performs integer division (5/2 => 2, 2/3 => 0)
- when fed a 0-value coin, the machine returns *one* 0-value coin (=> test case given).

** method wonky_coins(n)
- given an integer n
- return value: number of coins we have eventually "when feeding returned coins back into the machine"

** simple example:
feed a "3" into machine:
get back 3/2, 3/3 and 3/4
=> 1, 1, 0

feed 1, 1, 0 into machine:
for 1, get back 1/2, 1/3, 1/4 => all 0-coins
for 1, get back 1/2, 1/3, 1/4 => all 0-coins
for 0, get back 0

==> So now we have 7 coins, and the process stabilizes

** data structure

- store coin values in an array
- size of the array will give us required number of coins
- return values we need during recursion are values, in the end of recursion we need number of coins (=> wrapper method)

** algorithm

coins_array:
  given a coin with value `value`
  if value is 0
    return [0]
  else
    return coins_array(value/2) + coins_array(value/3) + coins_array(value/4)

wonky_coins:
  given a number `number`
  return the size of coins_array(number)

=end

# solution 1:

def coins_array(value)
  if value == 0
    [0]
  else
    coins_array(value / 2) + coins_array(value / 3) + coins_array(value / 4)
  end
end

def wonky_coins(value)
  coins_array(value).size
end

# solution 2: it turns out we don't really need the array, if we take the base case of the recursion to be `` (for "1 coin") instead of `[0]` (for "a singleton list of coins with value 0"). This simplifies matters, since we don't need the distinction between an auxiliary and a wrapper method:

def wonky_coins(value)
  if value == 0
    1
  else
    wonky_coins(value / 2) + wonky_coins(value / 3) + wonky_coins(value / 4)
  end
end



puts("\nTests for #wonky_coins")
puts("===============================================")
    puts "wonky_coins(1) == 3: "  + (wonky_coins(1) == 3).to_s
    puts "wonky_coins(5) == 11: "  + (wonky_coins(5) == 11).to_s
    puts "wonky_coins(6) == 15: "  + (wonky_coins(6) == 15).to_s
    puts "wonky_coins(0) == 1: "  + (wonky_coins(0) == 1).to_s
puts("===============================================")
