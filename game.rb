
require_relative 'human.rb'
require_relative 'computer.rb'

class Game
  def initialize
    @player = Person.new
    @computer = Computer.new
    run_game_breaker if @player.play_type == 2
    run_game_maker if @player.play_type == 1
  end

  private

  def run_game_maker
    code = @player.pick_code
    guess = %w[1 1 2 2]
    for i in 0..12
      if i == 12 
        puts "You win!"
        break
      end
      puts "\nTurn ##{i + 1}: The computer guesses #{guess}"
      if check_winner(guess, code)
        puts "You lose!"
        break
      end
      clues = @player.clues(guess, code)
      guess = @computer.computer_play(guess, clues)
    end
  end

  def run_game_breaker
    code = @computer.generate_code
    for i in 0..12
      if i == 12
        puts 'You lose!'
        print code
        break
      end
      puts "\nTurn ##{i + 1}: Type in four numbers (1-6)"
      guess = @player.guess_code
      if check_winner(guess, code)
        puts 'You win!'
        break
      end
      print @computer.clues(guess, code)
    end
  end

  def check_winner(guess, code)
    return true if guess == code
  end

end
