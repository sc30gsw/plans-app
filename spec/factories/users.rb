FactoryBot.define do
  factory :user do
    nickname { '1111test' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
