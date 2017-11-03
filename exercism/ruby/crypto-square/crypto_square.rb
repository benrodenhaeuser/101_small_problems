module BookKeeping
  VERSION = 1
end

class Crypto
  def initialize(plaintext)
    @plaintext = plaintext.gsub(/[^A-Z0-9]/i, '').downcase
  end

  def ciphertext
    return @plaintext if @plaintext.empty?

    matrix
      .transpose
      .map { |row| row.join }
      .join(' ')
  end

  private

  def matrix
    plain_with_blanks = @plaintext + (' ' * blanks)

    plain_with_blanks
      .chars
      .each_slice(cols)
      .with_object([]) do |slice, matrix|
        matrix << slice
      end
  end

  def cols
    Math.sqrt(@plaintext.length).ceil.to_i
  end

  def blanks
    (cols - (@plaintext.length % cols)) % cols
  end
end
