class CreateConvos < ActiveRecord::Migration
  def change
    create_table :convos do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :merits
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :convos, :user_id
    add_index :convos, :subject_id
  end
end
