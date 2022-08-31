class Player
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
end

class Computer < Player
  attr_reader :code, :list
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
  def initialize(play_type)
    if play_type == 2
      @code = []
    end
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

class Person < Player
  attr_accessor :code, :guess

  def initialize(play_type)
    if play_type == 1
      @code = []
    else
      @guess = []
    end
  end

  def pick_code
    puts "\nPlease enter the four numbers for your secret code (1-6): "
    gets.chomp.split('')
  end

  def guess_code
    gets.chomp.split('')
  end
end

class Game
  def initialize(player, computer, play_type)
    @player = player
    @computer = computer
    @play_type = play_type
    run_game_breaker if @play_type == 2
    run_game_maker if @play_type == 1
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
        puts code
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

puts "Press 1 to play as the code-maker or 2 to play as the code-breaker: "
play_type = gets.chomp.to_i
if play_type == 1
  coder = Person.new(1)
  comp = Computer.new(1)
else
  coder = Person.new(2)
  comp = Computer.new(2)
end

Game.new(coder, comp, play_type)

