require "factory_bot_rails"

Chewy.strategy(:atomic) do
  FactoryBot.create_list(:book, 5)
  FactoryBot.create_list(:user, 5)
end