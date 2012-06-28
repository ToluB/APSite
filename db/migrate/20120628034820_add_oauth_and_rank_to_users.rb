class AddOauthAndRankToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :rank, :string
    add_column :users, :pic_url, :string
  end
end
