class Spot < ApplicationRecord

	has_many :likes, dependent: :destroy
	has_many :like_comments, dependent: :destroy
  has_many :spot_images, dependent: :destroy
  belongs_to :user

  validates :spot_name, {presence: true, length:{maximum: 30}}
  validates :spot_introduce, {presence: true, length:{maximum: 200}}
  validates :country, {presence: true, length:{maximum: 30}}
  validates :transportation, presence: true
  validates :tourism_level, presence: true
  validates :good_season_start, presence: true
  validates :good_season_end, presence: true

  accepts_nested_attributes_for :spot_images, allow_destroy: true

	def self.search(search)
    if search
      Spot.where(['country LIKE ?', "%#{search}%"])
    else
      Spot.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
