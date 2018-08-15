class SpotImage < ApplicationRecord
  belongs_to :spot

  mount_uploader :spot_image, SpotImageUploader
end
