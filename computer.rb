class Computer
  attr_reader :code
  @@list = []
  for i in 1..6
    for j in 1..6
      for k in 1..6
        for l in 1..6
          @@list.push([i.to_s, j.to_s, k.to_s, l.to_s])
        end
      end
    end
  end

  def initialize
      @code = []
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

  def generate_code
    for i in 0..3
      @code[i] = rand(1..6).to_s
    end
    code
  end

  def computer_play(guess, clues)
    i = @@list.length - 1
    while i >= 0
      if clues != clues(guess, @@list[i])
        @@list.delete(@@list[i])
      end
      i -= 1
    end
    @@list[0]
  end
end
