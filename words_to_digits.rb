def words_to_digits(string)
  digit_hash = { "one" => "1", "two" => "2", "three" => "3" }
  words = string.split(/(\. |\.|, |,| )/)
  # ^ we account for comma, full stop and single space char
  # ^ note that the enclosing parentheses "( ... )" are crucial here to get the right result
  # p words
  words.each_with_index do |word,index|
    digit_hash.each do |key,value|
      if word == key
        words[index] = value
      end
    end
  end
  words.join
end

input_string = gets.chomp
puts words_to_digits(input_string)
