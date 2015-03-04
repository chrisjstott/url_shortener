class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :url_id

      t.timestamp
    end
    add_index :visits, [:user_id, :url_id]
  end
end
