class WelcomeController < ApplicationController
  def index
    @top_users = User.order(wins: :desc).limit(5)
  end
end
