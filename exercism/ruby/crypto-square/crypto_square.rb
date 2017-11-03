module BookKeeping
  VERSION = 1
end

class Crypto
  def initialize(plaintext)
    @plaintext = plaintext.gsub(/[^A-Z0-9]/i, '').downcase
  end

  def ciphertext
    return @plaintext if @plaintext.empty?

    plaintext_matrix
      .transpose
      .map(&:join)
      .join(' ')
  end

  private

  def plaintext_matrix
    plaintext_with_blanks = @plaintext + (' ' * blanks)

    plaintext_with_blanks
      .chars
      .each_slice(cols)
      .with_object([]) do |slice, plaintext_matrix|
        plaintext_matrix << slice
      end
  end

  def cols
    Math.sqrt(@plaintext.length).ceil
  end

  def blanks
    (cols - (@plaintext.length % cols)) % cols
  end
end
