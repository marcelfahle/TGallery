class Comment < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :comment, :photo_id

  belongs_to :photo

  validates :author_name, presence: true
  validates :comment, presence: true

  default_scope order: 'comments.created_at DESC'
end
