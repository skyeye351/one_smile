FactoryBot.define do
  factory :dog do
    user { nil }
    name { "Pochi" }
    breed { "Shiba Inu" }
    age { 3 }
    place { "Tokyo" }
    profile_image { "pochi.jpg" }
  end
end
