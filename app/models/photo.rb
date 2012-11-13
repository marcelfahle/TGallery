class Photo < ActiveRecord::Base
  acts_as_list

  attr_accessible :caption, :image, :is_active, :owner
  mount_uploader :image, ImageUploader
  belongs_to :gallery
  has_many :comments, dependent: :destroy
  has_many :photo_votes, dependent: :destroy

  validates :owner, length: { maximum: 40 }
  validates :caption, length: { maximum: 140 }


  def self.by_votes
    select('photos.*, coalesce(SUM(value), 0) as votes').
    joins('left join photo_votes on photo_id=photos.id').
    group('photos.id').
    order('votes desc')
  end

  def votes
    read_attribute(:votes) || photo_votes.sum(:value)
  end

end
