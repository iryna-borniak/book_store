FactoryBot.define do
  factory :book do
    title { "Sample Title" }
    author { Faker::Book.author }
    isbn { Faker::Number.number(digits: 13).to_s }
    description { Faker::Lorem.paragraph }
  end

  trait :empty_title do
    title { "" }
  end

  trait :new_title do
    title { "New Title" }
  end
end
