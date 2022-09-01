class Person
  attr_accessor :code, :guess, :play_type

  def initialize
    puts 'Press 1 to play as the code maker and 2 to play as the code breaker: '
    @play_type = gets.chomp.to_i
    @code = []
    @guess = []
  end

  def clues(guess, code)
    code_copy = code[0..-1]
    guess_copy = guess[0..-1]
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

  def pick_code
    puts "\nPlease enter the four numbers for your secret code (1-6): "
    gets.chomp.split('')
  end

  def guess_code
    gets.chomp.split('')
  end
end
