class RemoveWinnerFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :winner, :integer
  end
end
