class Comment < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :text

  belongs_to :photo
end
