class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :user_image

  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_comments, dependent: :destroy

  validates :name, {presence: true, length: {maximum: 20}}
  validates :email, presence: true
  validates :password_confirmation, {presence: true, length: {minimum: 8}}
  validates :accepted, presence: {message: 'を入力してください'}

end
