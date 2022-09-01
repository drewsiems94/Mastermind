class Person
  attr_reader :code, :play_type

  def initialize
    puts 'Press 1 to play as the code maker and 2 to play as the code breaker: '
    @play_type = gets.chomp.to_i
    @code = pick_code if @play_type == 1
  end

  def guess_code
    guess = gets.chomp.split('')
    until check_code(guess)
      puts "Try a new code: "
      guess = gets.chomp.split('')
    end
    guess
  end

  private

  def pick_code
    puts "\nPlease enter the four numbers for your secret code (1-6): "
    code = gets.chomp.split('')
    until check_code(code)
      puts "Try a new code: "
      code = gets.chomp.split('')
    end
    code
  end

  def check_code(code)
    valid = %w[1 2 3 4 5 6]
    if code.length == 4 && code.all? {|num| valid.include?(num) }
      return true
    else
      return false
    end
  end
end
