class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :tracked_id
      t.integer :tracker_id

      t.timestamps
    end
    add_index :relationships, :tracked_id
    add_index :relationships, :tracker_id
    add_index :relationships, [:tracked_id, :tracker_id], unique: true
    
  end
end
