class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :subject_id
      t.datetime :nextadm
      t.datetime :lastadm
      t.integer :passrt
      t.string :url

      t.timestamps
    end
    add_index :exams, :subject_id
  end
end
