class AddTopicToConvos < ActiveRecord::Migration
  def change
    add_column :convos, :topic_id, :integer
  end
end
