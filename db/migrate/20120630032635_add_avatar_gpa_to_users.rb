class AddAvatarGpaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :gpa, :float
  end
end
