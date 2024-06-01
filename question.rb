class Question

  attr_reader :number1, :number2, :correct_answer

  def initialize 
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @correct_answer = @number1 + @number2
  end

  def ask(player_name)
    puts "#{player_name}, what is #{@number1} + #{@number2}?"
    gets.chomp.to_i
  end

end