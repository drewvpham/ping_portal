class RemovePlayer1FromGames < ActiveRecord::Migration
  def change
    remove_column :games, :player_1, :integer
  end
end
