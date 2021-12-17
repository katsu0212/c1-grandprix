class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :titles, dependent: :destroy


  with_options presence: true do
    validates :user_name
    validates :email
    validates :password,     format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
  

  def liked_by?(post_id)
     likes.where(post_id: post_id).exists? 
  end
  
end
