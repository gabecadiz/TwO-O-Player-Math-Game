class Question
  def initialize(num1,num2)
    @num1 = num1
    @num2 = num2
  end

  def display_nums
    "What is #{@num1} + #{@num2} "
  end

  def check_answer(answer)
    (@num1 + @num2) == answer
  end
end