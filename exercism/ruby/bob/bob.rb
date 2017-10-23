class Remark
  def initialize(phrase)
    @phrase = phrase.strip
  end

  def question?
    @phrase[-1] == '?'
  end

  def insult?
    @phrase.match(/[A-Z]/i) && @phrase.upcase == @phrase
  end

  def no_content?
    @phrase.scan(/\s/).join == @phrase
  end
end

module Bob
  def self.hey(phrase)
    @@remark = Remark.new(phrase)
    reply
  end

  def self.reply
    if @@remark.insult?
      'Whoa, chill out!'
    elsif @@remark.question?
      'Sure.'
    elsif @@remark.no_content?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end

module BookKeeping
  VERSION = 1
end
