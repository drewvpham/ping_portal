class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :games, source: :player_1, foreign_key: :player_1_id
  validates_presence_of :username, :email
  validates :username, :email, uniqueness: { case_sensitive: false }

  def all_games
    Game.where(player_1: self).or(Game.where(player_2: self))
  end
end
