# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'

# This class runs the game
class Game
  def initialize
    @player = Person.new
    @computer = Computer.new
    run_game_breaker if @player.play_type == 2
    run_game_maker if @player.play_type == 1
  end

  private

  def run_game_maker
    guess = %w[1 1 2 2]
    13.times do |i|
      puts "\nTurn ##{i + 1}: The computer guesses #{guess}"
      break if check_winner(guess, @player.code)

      clues = @computer.clues(guess, @player.code)
      guess = @computer.computer_play(guess, clues)
    end
  end

  def run_game_breaker
    13.times do |i|
      break if lose?(i)

      puts "\nTurn ##{i + 1}: Type in four numbers (1-6)"
      guess = @player.guess_code
      break if check_winner(guess, @computer.code)

      print @computer.clues(guess, @computer.code)
    end
  end

  def check_winner(guess, code)
    if guess == code && @player.play_type == 1
      puts 'You lose!'
      true
    elsif guess == code && @player.play_type == 2
      puts 'You win!'
      true
    end
  end

  def lose?(count)
    if count == 12
      print "\nYou lose!\n#{@computer.code}"
      true
    end
  end
end
