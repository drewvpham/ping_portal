class AddPointsAgainstToUser < ActiveRecord::Migration
  def change
    add_column :users, :points_against, :integer
  end
end
