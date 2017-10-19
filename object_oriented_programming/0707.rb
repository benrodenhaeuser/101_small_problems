class GuessingGame
  def initialize(lower_bound, upper_bound)
    @range = (lower_bound..upper_bound)
    @number_of_guesses_remaining = Math.log2(@range.size).to_i + 1
    @target_number = @range.to_a.sample
    @current_guess = nil
  end

  def play
    initialize(@range.first, @range.last)

    while @number_of_guesses_remaining > 0
      puts "You have #{@number_of_guesses_remaining} remaining guess(es)."
      get_guess_from_user
      return puts "You win!" if @current_guess == @target_number
      give_hint
      @number_of_guesses_remaining -= 1
    end

    puts "Out of guesses! You lost!"
  end

  private

  def get_guess_from_user
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      @current_guess = gets.chomp.to_i
      break if @range.include?(@current_guess)
      puts "Not a valid input!"
    end
  end

  def give_hint
    puts "Your guess is too high!" if @current_guess > @target_number
    puts "Your guess is too low!" if @current_guess < @target_number
  end

end

GuessingGame.new(1, 1000).play
