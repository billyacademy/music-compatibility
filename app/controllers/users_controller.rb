class UsersController < ApplicationController
  def index
    @users = User.all
    @max_score = 0
    @curr_score = 0
  end
end
