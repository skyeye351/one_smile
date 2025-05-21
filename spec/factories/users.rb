FactoryBot.define do
  factory :user do
    first_name { "Taro" }
    last_name  { "Yamada" }
    email { "taro@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
