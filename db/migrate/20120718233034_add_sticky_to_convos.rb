class AddStickyToConvos < ActiveRecord::Migration
  def change
    add_column :convos, :sticky, :boolean, default: false
  end
end
