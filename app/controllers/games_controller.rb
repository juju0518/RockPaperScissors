class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    user_move = params[:move]
    computer_move = %w[rock paper scissors].sample
    result = determine_result(user_move, computer_move)
    game = @user.games.create(user_move: user_move, computer_move: computer_move, result: result)
    @user.increment!(:games_played)
    @user.increment!(:wins) if result == "win"
    redirect_to game_path(game)
  end

  def new
    @user = User.find(params[:user_id])
  end

  private

  def determine_result(user, computer)
    return "draw" if user == computer
    win_conditions = {
      "rock" => "scissors",
      "paper" => "rock",
      "scissors" => "paper"
    }
    win_conditions[user] == computer ? "win" : "lose"
  end
end
