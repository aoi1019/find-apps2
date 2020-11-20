FactoryBot.define do
  factory :app do
    name {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    description {"アプリです"}
    point {"bootstrapで開発しました"}
    reference {"https://find-apps.herokuapp.com/"}
    language {"Ruby on Rails"}
    period {10}
    association :user
  end
end