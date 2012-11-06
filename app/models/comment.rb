class Comment < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :text, :photo_id

  belongs_to :photo

  validates :author_email, presence: true
  validates :text, presence: true

  default_scope order: 'comments.created_at DESC'
end
