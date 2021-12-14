FactoryBot.define do
  factory :post do
    body      {'アイウエオ'}
    image_id     {'5fe9c8c01a870e9d8d21624a284967d72b93bef15614da2d5943dcc45767'}
    association :user
    
  end
end
