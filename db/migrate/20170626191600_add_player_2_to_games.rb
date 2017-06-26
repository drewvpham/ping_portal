class AddPlayer2ToGames < ActiveRecord::Migration
  def change
    add_reference :games, :player_2, index: true, foreign_key: true
  end
end
