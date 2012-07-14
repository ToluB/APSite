class Doc < ActiveRecord::Base
  #doc=document, as I believe the term 'document' may be reserved
  attr_accessible :attachment, :description, :docable_id, :docable_type, :name, :user_id, :remote_attachment_url, :remove_attachment
  
  belongs_to :docable, :polymorphic => true
  mount_uploader :attachment, FileUploader
end
