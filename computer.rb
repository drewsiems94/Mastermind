class Computer
  attr_reader :code

  def initialize
    @code = []
    4.times { @code.push(rand(1..6).to_s) }
    @list = %w[1 2 3 4 5 6].repeated_permutation(4).to_a
  end

  def clues(guess, code)
    code_copy = code.clone
    guess_copy = guess.clone
    clue_arr = []
    i = 3
    while i >= 0
      if guess_copy[i] == code_copy[i]
        code_copy.delete_at(i)
        guess_copy.delete_at(i)
        clue_arr.push('x')
      end
      i -= 1
    end
    j = (code_copy.length - 1)
    while j >= 0
      if guess_copy.include?(code_copy[j])
        index = guess_copy.index(code_copy[j])
        guess_copy.delete_at(index)
        code_copy.delete_at(j)
        clue_arr.push('o')
      end
      j -= 1
    end
    clue_arr
  end

  def computer_play(guess, clues)
    @list.reject! { |code| clues != clues(guess, code) }
    @list[0]
  end
end
