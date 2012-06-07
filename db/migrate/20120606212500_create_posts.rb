class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :convo_id
      t.integer :merits
      t.integer :skill

      t.timestamps
    end
  end
end
