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

    header "Welcome To The best Math Game"

    while (not game_over?)

      current_player = @turn.current_player
      print "#{@turn.current_player.name} "

      question = Question.new
      puts question.display_nums

      user_answer = $stdin.gets.chomp.to_i
      if question.check_answer(user_answer)
        puts "YAS! You are correct!"
      else
        puts "Seriously? Nope, wrong!!!"
        current_player.lose_life
      end

      header "Next Turn"

      game_summary
      @turn.next_turn
      sleep 0.75

    end

    winner
    header "Game Over"
  end

  private

  def game_over?
    @player1.lives == 0 || @player2.lives ==0
  end

  def header(message)
    puts "===== #{message} ====="
    puts
  end

  def game_summary
    puts "#{@player1.name} : #{@player1.lives}/3 vs. #{@player2.name} : #{@player2.lives}/3"
  end

  def winner
    if @player1.lives === 0
      puts
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts
    else
      puts
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts
    end
  end

end