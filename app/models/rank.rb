class Rank < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :title
end
