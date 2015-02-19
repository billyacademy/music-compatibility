class Artist < ActiveRecord::Base
  has_many :tastes
  validates :name, presence: true

  def self.rand_unrated_artist(user)
    array = []
    Artist.all.each do |artist|
      if Taste.find_by(artist_id: artist, user_id: user)
      else
        array << artist
      end
    end
    array.sample
  end
end
