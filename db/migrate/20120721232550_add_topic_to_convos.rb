class AddTopicToConvos < ActiveRecord::Migration
  def change
    add_column :convos, :topic, :string
  end
end
