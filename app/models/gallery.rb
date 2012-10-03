class Gallery < ActiveRecord::Base
  attr_accessible :background, :email, :has_comments, :has_rating, :name, :show_headline, :top_margin, :headline_color, :text_color
  mount_uploader :background, BackgroundUploader
  has_many :photos, :dependent => :destroy
end
