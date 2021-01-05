FactoryBot.define do
  factory :user do
    nickname {'1a' + Faker::Name.name(min_length: 4)(max_length: 16)}
    email {Fkaer::Internet.free_email}
    password{'1a' + Faker::Internet.password(min_length: 8)}
    password_confitmation {password}
  end
end
