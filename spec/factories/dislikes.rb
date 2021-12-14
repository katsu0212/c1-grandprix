FactoryBot.define do
  factory :dislike do
    association :post
    association :user
  end
end
