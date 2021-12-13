class Post < ApplicationRecord
  belongs_to :user 
  attachment :image
  has_many :likes, dependent: :destroy
  has_many :dislike, dependent: :destroy
  
  with_options presence: true do
    validates :body
    validates :image
  end
end
