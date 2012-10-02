class Gallery < ActiveRecord::Base
  attr_accessible :background, :email, :has_comments, :has_rating, :name, :show_headline, :top_margin
  mount_uploader :background, BackgroundUploader
  has_many :photos, :dependent => :destroy
end
