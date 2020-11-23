FactoryBot.define do
  factory :comment do
    content { "素晴らしいですね！" }
    association :user
    association :app
  end
end