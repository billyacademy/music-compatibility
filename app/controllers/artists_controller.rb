class ArtistsController < ApplicationController
  def index
    @opinion = ["Love", "Like", "Don't Know", "Dislike"]
    @artist = Artist.first(:order => "RANDOM()")
  end
end
