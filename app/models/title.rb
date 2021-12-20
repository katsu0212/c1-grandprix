class Title < ApplicationRecord
  belongs_to :user 
  has_many :smiles, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :theme
  
  with_options presence: true do
    validates :content
    validates :theme_id,           numericality: { other_than: 1 , message: "can't be blank"}
  end
end
