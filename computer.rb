# This class contains the logic for the computer's play 
class Computer
  attr_reader :code

  def initialize
    @code = []
    4.times { @code.push(rand(1..6).to_s) }
    @list = %w[1 2 3 4 5 6].repeated_permutation(4).to_a
  end

  def clues(guess, code)
    temp_guess = guess.clone
    temp_code = code.clone
    clues = check_position(temp_guess, temp_code)
    check_value(temp_guess, temp_code, clues)
  end

  def computer_play(guess, clues)
    @list.reject! { |code| clues != clues(guess, code) }
    @guess = @list[0]
  end

  private

  def check_position(guess, code)
    clue_array = []
    (code.length - 1).downto(0) do |i|
      if code[i] == guess[i]
        code.delete_at(i)
        guess.delete_at(i)
        clue_array.push('x')
      end
    end
    clue_array
  end

  def check_value(guess, code, clues)
    code.reverse_each do |num|
      if guess.include?(num)
        guess.delete_at(guess.index(num))
        code.delete(num)
        clues.push('o')
      end
    end
    clues
  end
end
