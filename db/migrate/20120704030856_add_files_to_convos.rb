class AddFilesToConvos < ActiveRecord::Migration
  def change
    add_column :convos, :file, :string
  end
end
