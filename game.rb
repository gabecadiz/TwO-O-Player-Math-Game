require_relative 'player'
require_relative 'question'
require_relative 'turn'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @turn = Turn.new(@players)

  end

  def play

    header "Welcome to da Game"

    while (not game_over?)
      print "#{@turn.current_player.name} "
      # puts "#{@current_player.name} please provide two numbers"
      # puts "Provide first number"
      # choice1 = $stdin.gets.chomp.to_i
      # puts "Provide second number"
      # choice2 = $stdin.gets.chomp.to_i

      math_question = Question.new
      puts math_question.display_nums

      user_answer = $stdin.gets.chomp.to_i
      if math_question.check_answer(user_answer)
        puts "Correct!"
      else
        puts "Wrong!"
      end

      game_summary

      @turn.next_turn
      header "Next Turn"
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

  def game_summary
    puts "#{@player1.name} : #{@player1.lives}/3 vs. #{@player2.name} : #{@player2.lives}/3"
  end
end