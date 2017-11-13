# introducing an extra class for the chars does not make much sense, but it
# was fun anyway

class ROT
  def self.convert(text, rot = 13)
    @@rot = rot
    new(text).convert
  end

  def self.create(char)
    raise ArgumentError unless char.instance_of?(String)

    case char
    when ('A'..'Z') then UpperChar.new(char, @@rot)
    when ('a'..'z') then LowerChar.new(char, @@rot)
    else
      NonLetterChar.new(char, @@rot)
    end
  end

  def initialize(text)
    @text = text
    @convertable_chars = convertable_chars
  end

  def convertable_chars
    @text.chars.map { |char| self.class.create(char) }
  end

  def convert
    @convertable_chars.map do |convertable_char|
      convertable_char.convert
    end.map(&:to_s).join
  end
end

class ConvertableChar
  ALPHABET = ('a'..'z').to_a
  ALPHABET_UPPER = ('A'..'Z').to_a

  def initialize(char, rot)
    @char = char
    @rot = rot
  end

  def to_s
    @char
  end
end

class UpperChar < ConvertableChar
  UPPER_TO_NUMBER = ALPHABET_UPPER.zip(0...ALPHABET.length).to_h
  NUMBER_TO_UPPER = UPPER_TO_NUMBER.invert

  def convert
    char = NUMBER_TO_UPPER[(UPPER_TO_NUMBER[@char] + @rot) % ALPHABET.length]
    UpperChar.new(char, @rot)
  end
end

class LowerChar < ConvertableChar
  LOWER_TO_NUMBER = ALPHABET.zip(0...ALPHABET.length).to_h
  NUMBER_TO_LOWER = LOWER_TO_NUMBER.invert

  def convert
    char = NUMBER_TO_LOWER[(LOWER_TO_NUMBER[@char] + @rot) % ALPHABET.length]
    LowerChar.new(char, @rot)
  end
end

class NonLetterChar < ConvertableChar
  def convert
    NonLetterChar.new(@char, @rot)
  end
end

p ROT.convert('Nqn Ybirynpr')
p ROT.convert('Tenpr Ubccre')
p ROT.convert('Nqryr Tbyqfgvar')
p ROT.convert('Nyna Ghevat')
p ROT.convert('Puneyrf Onoontr')
p ROT.convert('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p ROT.convert('Wbua Ngnanfbss')
p ROT.convert('Ybvf Unvog')
p ROT.convert('Pynhqr Funaaba')
p ROT.convert('Fgrir Wbof')
p ROT.convert('Ovyy Tngrf')
p ROT.convert('Gvz Orearef-Yrr')
p ROT.convert('Fgrir Jbmavnx')
p ROT.convert('Xbaenq Mhfr')
p ROT.convert('Fve Nagbal Ubner')
p ROT.convert('Zneiva Zvafxl')
p ROT.convert('Lhxvuveb Zngfhzbgb')
p ROT.convert('Unllvz Fybavzfxv')
p ROT.convert('Tregehqr Oynapu')
