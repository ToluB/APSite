class Doc < ActiveRecord::Base
  #doc=document, as I believe the term 'document' may be reserved
  attr_accessible :attachment, :description, :name, :user_id, :remote_attachment_url, :remove_attachment
  
  belongs_to :user
  belongs_to :docable, :polymorphic => true
  mount_uploader :attachment, FileUploader
end
