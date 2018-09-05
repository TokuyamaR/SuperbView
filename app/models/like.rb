class Like < ApplicationRecord
	belongs_to :user
	belongs_to :spot, counter_cache: :likes_count

	validates :user_id, presence: true
	validates :spot_id, presence: true
end
