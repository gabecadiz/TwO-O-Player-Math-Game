class Question
  def initialize
    @num1 = rand(20) + 1
    @num2 = rand(20) + 1
  end

  def display_nums
    "What is #{@num1} + #{@num2} "
  end

  def check_answer(answer)
    (@num1 + @num2) == answer
  end
end