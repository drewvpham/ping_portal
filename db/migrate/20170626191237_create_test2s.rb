class CreateTest2s < ActiveRecord::Migration
  def change
    create_table :test2s do |t|
      t.references :player_1, index: true, foreign_key: true
      t.references :player_2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
