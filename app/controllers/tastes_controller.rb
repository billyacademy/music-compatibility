class TastesController < ApplicationController
  def new
    @taste = Taste.new
  end

  def create
    @taste = Taste.new(taste_params)
    if @taste.save && @taste.opinion == "Love"
      redirect_to artists_path,
      notice: "You have declared your love for #{Artist.find(@taste.artist_id).name}!"
    elsif @taste.save && @taste.opinion == "Like"
      redirect_to artists_path,
      notice: "Ohh, I guess you like #{Artist.find(@taste.artist_id).name}!"
    elsif @taste.save && @taste.opinion == "Don't Know"
      redirect_to artists_path,
      notice: "It's okay, not everyone knows #{Artist.find(@taste.artist_id).name}!"
    elsif @taste.save && @taste.opinion == "Dislike"
      redirect_to artists_path,
      notice: "#{Artist.find(@taste.artist_id).name} isn't for everyone, we won't tell!"
    else
      redirect_to artists_path,
      notice: "Something went wrong, please try again."
    end
  end

  private

  def taste_params
    params.permit(:user_id, :artist_id, :opinion)
  end
end
