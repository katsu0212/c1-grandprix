FactoryBot.define do
  factory :user do
    user_name              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {"aaa111"}
  end
end