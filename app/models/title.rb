class Title < ApplicationRecord
  belongs_to :user 
  has_many :smiles, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :theme
  
  with_options presence: true do
    validates :title_id
    validates :content
    validates :title_id,           numericality: { other_than: 1 , message: "can't be blank"}
  end
end
