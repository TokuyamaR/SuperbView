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
  # validates :password_confirmation, {presence: true, length: {minimum: 8}}
  validates :accepted, presence: {message: 'を入力してください'}

  # ユーザーの論理削除用（退会用）メソッド

  # 退会日時を記録
  def soft_delete
    update(deleted_at: Time.now)
  end

  #ユーザーがログイン可能かどうかの判定メソッド（deviseの独自メソッド）
  def active_for_authentication?
    !deleted_at
  end

  #退会したユーザーがログインしようとした時のバリデーションメッセージ
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

end
