class Gallery < ActiveRecord::Base
  attr_accessible :background, :email, :has_comments, :has_rating, :name, :show_headline, :top_margin, :headline_color, :text_color
  attr_accessible :site_width, :photo_border, :photo_border_color, :photo_border_width, :thumb_size, :background_color
  attr_accessible :remove_background, :show_names, :instructions, :description, :is_active, :tos_text


  mount_uploader :background, BackgroundUploader
  has_many :photos, :dependent => :destroy


end
