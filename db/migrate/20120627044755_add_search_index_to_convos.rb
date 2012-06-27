class AddSearchIndexToConvos < ActiveRecord::Migration
  def up
    execute "create index convos_title on convos using gin(to_tsvector('english', title))"
    execute "create index convos_content on convos using gin(to_tsvector('english', content))"
  end
  
  def down
    execute "drop index convos_title"
    execute "drop index convos_content"
  end
end
