class Gallery < ActiveRecord::Base
  attr_accessible :background, :email, :has_comments, :has_rating, :name
end
