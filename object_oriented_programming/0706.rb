class GuessingGame

  MAX_GUESSES = 7
  RANGE = (1..100)

  def initialize
    @number_of_guesses_remaining = MAX_GUESSES
    @target_number = RANGE.to_a.sample
  end

  def play
    initialize

    while @number_of_guesses_remaining > 0
      puts "You have #{@number_of_guesses_remaining} remaining guess(es)."
      get_guess_from_user
      break puts "You win!" if @guess == @target_number
      give_hint
      @number_of_guesses_remaining -= 1
    end

    puts "Out of guesses! You lost!" if @number_of_guesses_remaining == 0
    puts
  end

  private

  def get_guess_from_user
    loop do
      print "Enter a number between 1 and 100: "
      @guess = gets.chomp.to_i
      break if RANGE.include?(@guess)
      puts "Not a valid input!"
    end
  end

  def give_hint
    puts "Your guess is too high!" if @guess > @target_number
    puts "Your guess is too low!" if @guess < @target_number
  end

end

game = GuessingGame.new
game.play
game.play
