class Person
  attr_accessor :code, :guess, :play_type

  def initialize
    puts 'Press 1 to play as the code maker and 2 to play as the code breaker: '
    @play_type = gets.chomp.to_i
    @code = []
    @guess = []
  end

  def pick_code
    puts "\nPlease enter the four numbers for your secret code (1-6): "
    gets.chomp.split('')
  end

  def guess_code
    gets.chomp.split('')
  end
end
