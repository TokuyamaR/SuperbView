class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :user_image

  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_comments, dependent: :destroy


end
