class DefaultMeritsToZero < ActiveRecord::Migration
  def change
    change_column_default(:users, :umerits, 0)
    change_column_default(:users, :merits, 0)
    change_column_default(:convos, :merits, 0)
    change_column_default(:posts, :merits, 0)
    
  end
end
