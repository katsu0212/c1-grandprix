class Post < ApplicationRecord
  belongs_to :user 
  has_one_attached :image
  has_many :likes, dependent: :destroy
  with_options presence: true do
    validates :body
    validates :image
  end
end
