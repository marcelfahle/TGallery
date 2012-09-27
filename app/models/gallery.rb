class Gallery < ActiveRecord::Base
  attr_accessible :background, :email, :has_comments, :has_rating, :name
  mount_uploader :background, BackgroundUploader
end
