FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6, max_length: 128) }
    username { Faker::Internet.username }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }    
  end

  trait :wrong_password do    
    password { Faker::Internet.password(min_length: 2, max_length: 5) }
  end
end
