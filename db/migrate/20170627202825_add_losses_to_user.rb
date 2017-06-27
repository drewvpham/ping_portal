class AddLossesToUser < ActiveRecord::Migration
  def change
    add_column :users, :losses, :integer
  end
end
