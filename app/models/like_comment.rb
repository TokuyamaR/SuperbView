class LikeComment < ApplicationRecord
	belongs_to :user
	belongs_to :spot

	validates :title, {presence: true, length:{maximum: 30}}
    validates :text, {presence: true, length:{maximum: 200}}
    validates :spot_id, presence: true

end
