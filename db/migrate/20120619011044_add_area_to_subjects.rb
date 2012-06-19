class AddAreaToSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :area_id, :string
    add_column :subjects, :area_id, :integer
  end
end
