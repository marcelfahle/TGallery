class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :is_active, :owner
  mount_uploader :image, ImageUploader
end
