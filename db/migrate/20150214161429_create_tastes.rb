class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|
      t.integer :user_id
      t.integer :artist_id
      t.string :opinion

      t.timestamps
    end
    add_index :tastes, [:user_id, :artist_id], unique: true
  end
end
