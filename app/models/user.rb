class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :titles, dependent: :destroy
  has_many :smiles, dependent: :destroy
  with_options presence: true do
    validates :user_name
    validates :email
  end
  
  def liked_by?(post_id)
     likes.where(post_id: post_id).exists? 
  end

  def smile_by?(title_id)
     smiles.where(title_id: title_id).exists? 
  end
  
end
