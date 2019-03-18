require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @current_turn = 0
    @current_player = @player1

  end

  def play

    header "Welcome to da Game"

    while (not game_over?)
      @player1.lose_life

      puts "#{@current_player.name} please provide two numbers"
      puts "Provide first number"
      choice1 = $stdin.gets.chomp.to_i
      puts "Provide second number"
      choice2 = $stdin.gets.chomp.to_i

      math_question = Question.new(choice1, choice2)
      puts math_question.display_nums

      user_answer = $stdin.gets.chomp.to_i
      puts math_question.check_answer(user_answer) ? "Correct!" : "Wrong!"


      sleep 0.5
    end

    header "Game Over"
  end

  private

  def game_over?
    @player1.lives == 0 || @player2.lives ==0
  end

  def header(message)
    puts
    puts "===== #{message} ====="
    puts
  end
end