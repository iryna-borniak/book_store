FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    isbn { Faker::Number.number(digits: 13).to_s }
    description { Faker::Lorem.paragraph(sentence_count: 30) }
    cover_image { Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "cover.jpg"), "image/jpeg") }
    pdf_file { Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "book.pdf"), "application/pdf") }    
  end

  trait :empty_title do
    title { "" }
  end

  trait :new_title do
    title { "New Title" }
  end
end
