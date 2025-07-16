FactoryBot.define do
  factory :dog do
    user { nil }
    name { "MyString" }
    breed { "MyString" }
    age { 1 }
    place { "MyString" }
    profile_image { "MyString" }
  end
end
