class CreateExamprefs < ActiveRecord::Migration
  def change
    create_table :examprefs do |t|
      t.string :user_id
      t.string :exam_id
      t.boolean :taken
      t.datetime :datetaken
      t.integer :score
      t.text :exp1

      t.timestamps
    end
    add_index :examprefs, :user_id
    add_index :examprefs, :exam_id
    add_index :examprefs, [:user_id, :exam_id]
  end
end
