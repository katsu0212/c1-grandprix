FactoryBot.define do
  factory :title do
    content      {'テスト'}
    theme_id     {2}
    association :user
  end
end
