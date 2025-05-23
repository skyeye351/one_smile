FactoryBot.define do
  factory :board do
    title { "テストタイトル" }
    body { "テストコンテンツ" }
    association :user
  end
end
