class ArtistsController < ApplicationController
  def index
    @artist = Artist.rand_unrated_artist(current_user)
  end
end
