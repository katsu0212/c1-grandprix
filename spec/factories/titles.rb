FactoryBot.define do
  factory :title do
    content      {'ใในใ'}
    theme_id     {2}
    association :user
  end
end
