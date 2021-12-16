FactoryBot.define do
  factory :user do
    user_name              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {"aaa111"}
    profile_image_id  {'5fe9c8c01a870e9d8d21624a284967d72b93bef15614da2d5943dcc45767'}
    
  end
end