class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :recipient_id
      t.text :content
      t.boolean :private, :default => false

      t.timestamps null: false
    end
  end
end
