class Title < ApplicationRecord
  belongs_to :user 
  has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :theme
  
end
