class PhotoVote < ActiveRecord::Base
  attr_accessible :photo_id, :photo, :value

  belongs_to :photo

  validates_inclusion_of :value, in: [1, -1]
end
