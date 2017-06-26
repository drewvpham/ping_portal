class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_1
      t.integer :player_2
      t.integer :player_1_score
      t.integer :player_2_score
      t.integer :winner
      t.datetime :time
      t.string :location

      t.timestamps null: false
    end
  end
end
