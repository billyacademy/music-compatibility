class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(4)
    @max_score = 0
    @curr_score = 0
  end
end
