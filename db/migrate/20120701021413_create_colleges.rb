class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :region
      t.string :state
      t.integer :usnrank
      t.integer :satmed
      t.float :gpamed
      t.float :acceptrate
      t.string :url

      t.timestamps
    end
  end
end
