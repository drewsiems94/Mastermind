class Person
  attr_reader :code, :play_type

  def initialize
    puts 'Press 1 to play as the code maker and 2 to play as the code breaker: '
    @play_type = gets.chomp.to_i
    @code = pick_code if @play_type == 1
  end

  def guess_code
    gets.chomp.split('')
  end

  private

  def pick_code
    puts "\nPlease enter the four numbers for your secret code (1-6): "
    gets.chomp.split('')
  end
end
