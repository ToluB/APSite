class Doc < ActiveRecord::Base
  #doc=document, as I believe the term 'document' may be reserved
  attr_accessible :attachment, :description, :docable_id, :docable_type, :name, :user_id
  
  belongs_to :docable, :polymorphic => trues
  mount_uploader :attachment, FileUploader
end
