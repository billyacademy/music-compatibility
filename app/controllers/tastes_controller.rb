class TastesController < ApplicationController
  def new
    @taste = Taste.new
  end

  def create
    @taste = Taste.new
    @taste.user_id = params["user_id"]
    @taste.artist_id = params["artist_id"]
    @taste.opinion = params["opinion"]
    if @taste.save!
      redirect_to artists_path,
      notice: "You have successfully rated an artist!"
    else
      render artists_path,
      notice: "Something went wrong, please try again."
    end
  end

  private

  def taste_params
    params.require(:taste).permit(:user_id, :artist_id, :opinion)
  end
end
