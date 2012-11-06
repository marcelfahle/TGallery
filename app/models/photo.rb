class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :is_active, :owner
  mount_uploader :image, ImageUploader
  belongs_to :gallery
  has_many :comments, dependent: :destroy
end
