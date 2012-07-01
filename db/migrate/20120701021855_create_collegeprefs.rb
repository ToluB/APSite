class CreateCollegeprefs < ActiveRecord::Migration
  def change
    create_table :collegeprefs do |t|
      t.integer :user_id
      t.integer :college_id
      t.string :pref
      t.text :exp

      t.timestamps
    end
    add_index :collegeprefs, :user_id
    add_index :collegeprefs, :college_id 
    add_index :collegeprefs, [:user_id, :college_id]
  end
end
