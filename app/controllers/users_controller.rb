class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username_reqs)
    @user.wins = 0
    @user.games_played = 0
    if @user.save
      redirect_to user_play_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def username_reqs
    params.require(:user).permit(:username)
  end
end
