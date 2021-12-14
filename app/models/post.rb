class Post < ApplicationRecord
  belongs_to :user 
  attachment :image
  has_many :likes, dependent: :destroy
  has_many :dislike, dependent: :destroy

  with_options presence: true do
    validates :body,  presence: { message: 'ひとこと入力してください。' }
    validates :image, presence: { message: '画像を添付してください。' }
  end
end
