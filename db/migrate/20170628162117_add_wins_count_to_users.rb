class AddWinsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wins_count, :integer, default: 0
  end
end
