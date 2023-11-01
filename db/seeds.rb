require "faker"

5.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    isbn: Faker::Number.number(digits: 13),
    description: Faker::Lorem.paragraph(sentence_count: 10)
  )
end
