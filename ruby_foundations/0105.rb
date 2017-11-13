class ROT13
  def self.convert(text)
    new(text).convert
  end

  def self.create(char)
    case char
    when ('A'..'Z') then UpperChar.new(char)
    when ('a'..'z') then LowerChar.new(char)
    else
      NonLetterChar.new(char)
    end
  end

  def initialize(text)
    @text = text
  end

  def convertable_chars
    @text.chars.map { |char| self.class.create(char) }
  end

  def convert
    convertable_chars.map do |convertable_char|
      convertable_char.convert
    end.map(&:to_s).join
  end
end

class ConvertableChar
  ALPHABET = ('a'..'z').to_a
  ROT = 13

  def initialize(char)
    @char = char
  end

  def to_s
    @char
  end
end

class NonLetterChar < ConvertableChar
  def convert
    NonLetterChar.new(@char)
  end
end

# TODO: the ALPHABET constant does not play a role, except for its lenght

class UpperChar < ConvertableChar
  UPPER_TO_NUMBER = ('A'..'Z').zip(0...ALPHABET.length).to_h
  NUMBER_TO_UPPER = UPPER_TO_NUMBER.invert

  def convert
    char = NUMBER_TO_UPPER[(UPPER_TO_NUMBER[@char] + ROT) % ALPHABET.length]
    UpperChar.new(char)
  end
end

class LowerChar < ConvertableChar
  LOWER_TO_NUMBER = ('a'..'z').zip(0...ALPHABET.length).to_h
  NUMBER_TO_LOWER = LOWER_TO_NUMBER.invert

  def convert
    char = NUMBER_TO_LOWER[(LOWER_TO_NUMBER[@char] + ROT) % ALPHABET.length]
    LowerChar.new(char)
  end
end

p ROT13.convert('Nqn Ybirynpr')
p ROT13.convert('Tenpr Ubccre')
p ROT13.convert('Nqryr Tbyqfgvar')
p ROT13.convert('Nyna Ghevat')
p ROT13.convert('Puneyrf Onoontr')
p ROT13.convert('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p ROT13.convert('Wbua Ngnanfbss')
p ROT13.convert('Ybvf Unvog')
p ROT13.convert('Pynhqr Funaaba')
p ROT13.convert('Fgrir Wbof')
p ROT13.convert('Ovyy Tngrf')
p ROT13.convert('Gvz Orearef-Yrr')
p ROT13.convert('Fgrir Jbmavnx')
p ROT13.convert('Xbaenq Mhfr')
p ROT13.convert('Fve Nagbal Ubner')
p ROT13.convert('Zneiva Zvafxl')
p ROT13.convert('Lhxvuveb Zngfhzbgb')
p ROT13.convert('Unllvz Fybavzfxv')
p ROT13.convert('Tregehqr Oynapu')
