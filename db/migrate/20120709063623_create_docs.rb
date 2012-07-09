class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :docable_id
      t.string :docable_type
      t.string :attachment

      t.timestamps
    end
    add_index :docs, :user_id
    add_index :docs, [:docable_type, :docable_id]
  end
end
