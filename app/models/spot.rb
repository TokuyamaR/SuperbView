class Spot < ApplicationRecord
	def self.search(search)
    if search
    Spot.where(['content LIKE ?', "%#{search}%"])
    else
    Spot.all
    end
  end
end
