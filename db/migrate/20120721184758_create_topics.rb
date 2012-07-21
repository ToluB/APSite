class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :subject_id

      t.timestamps
    end
    add_index :topics, :subject_id
  end
end
