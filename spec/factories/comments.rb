FactoryBot.define do
  factory :comment do
    body { "テストコメント" }
    association :user
    association :board
  end
end
