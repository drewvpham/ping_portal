class AddPlayer1ToGames < ActiveRecord::Migration
  def change
    add_reference :games, :player_1, index: true, foreign_key: true
  end
end
