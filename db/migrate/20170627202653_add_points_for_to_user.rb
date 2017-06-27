class AddPointsForToUser < ActiveRecord::Migration
  def change
    add_column :users, :points_for, :integer
  end
end
