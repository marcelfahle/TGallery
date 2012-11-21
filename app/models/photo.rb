class Photo < ActiveRecord::Base
  acts_as_list

  attr_accessible :caption, :image, :is_active, :owner, :owner_email, :video, :video_poster, :is_video, :terms_of_service
  
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :video_poster, VideoPosterUploader
  belongs_to :gallery
  has_many :comments, dependent: :destroy
  has_many :photo_votes, dependent: :destroy

  #validates :owner, length: { maximum: 40 }
  validates :caption, presence: true, length: { maximum: 499 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :owner_email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_acceptance_of :terms_of_service


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
