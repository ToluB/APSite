class AddFbookInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bday, :datetime
    add_column :users, :location, :string
  end
end
