class Taste < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist

  validates :user_id,
    presence: true,
    uniqueness: { scope: :artist_id }

  validates :artist_id,
    presence: true
end
