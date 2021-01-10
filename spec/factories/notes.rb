FactoryBot.define do
  factory :note do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    plan {Faker::Lorem.sentence}
    association :user
  end
end
