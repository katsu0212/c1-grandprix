class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislike, dependent: :destroy

  validates :user_name, presence: true

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  def disliked_by?(post_id)
    dislike.where(post_id: post_id).exists?
  end
  
end
