require_relative 'player'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")

  end

  def play
    while (not game_over?)
      @player1.lose_life
      header "Next Turn"
      p @player1

      sleep 0.5
    end

    puts "Game Over"

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