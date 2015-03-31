class Taste < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist

  validates :user_id,
    presence: true,
    uniqueness: { scope: :artist_id }

  validates :artist_id,
    presence: true

  def self.compare(cur_user, other_user)
    where(:user_id => [cur_user, other_user])
  end

  def self.comparison_hash(array)
    hash = Hash.new
    array.each do |taste|
      if hash[taste.artist_id] == nil
        hash[taste.artist_id] = { taste.user_id => taste.opinion }
      else
        hash[taste.artist_id].store(taste.user_id, taste.opinion)
      end
    end
    hash
  end
end
