class SpotImage < ApplicationRecord
  belongs_to :spot
  attachment :image

  validates :image, presence: true
  validates :spot_id, presence: true
end
