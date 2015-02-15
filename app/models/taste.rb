class Taste < ActiveRecord::Base
  validates :user_id,
    presence: true,
    uniqueness: { scope: :artist_id }

  validates :artist_id,
    presence: true
end
