class Spot < ApplicationRecord

	has_many :likes, dependent: :destroy
	has_many :like_comments, dependent: :destroy
  has_many :spot_images, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :spot_images

	def self.search(search)
    if search
      Spot.where(['content LIKE ?', "%#{search}%"])
    else
      Spot.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
