class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :area_id

      t.timestamps
    end
    add_index :subjects, :area_id
  end
end
