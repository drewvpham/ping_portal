class RemovePlayer2FromGames < ActiveRecord::Migration
  def change
    remove_column :games, :player_2, :integer
  end
end
