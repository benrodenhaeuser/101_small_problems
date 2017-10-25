class BeerSong

  STANDARD = <<-TEXT
%{number} bottles of beer on the wall, %{number} bottles of beer.
Take one down and pass it around, %{next_number} bottles of beer on the wall.
TEXT

  TWO_BOTTLES = <<-TEXT
%{number} bottles of beer on the wall, %{number} bottles of beer.
Take one down and pass it around, %{next_number} bottle of beer on the wall.
TEXT

  ONE_BOTTLE = <<-TEXT
%{number} bottle of beer on the wall, %{number} bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
TEXT

  ZERO_BOTTLES = <<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, %{next_number} bottles of beer on the wall.
TEXT

  def verse(number)
    text =
      case number
      when (3..99) then STANDARD
      when 2 then TWO_BOTTLES
      when 1 then ONE_BOTTLE
      when 0 then ZERO_BOTTLES
      end

    text % { number: number, next_number: (number - 1) % 100 }
  end

  def verses(from, to)
    (to..from).map do |number|
      verse(number)
    end.reverse.join("\n")
  end
end

module BookKeeping
  VERSION = 3
end
