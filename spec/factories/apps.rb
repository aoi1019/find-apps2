FactoryBot.define do
  factory :app do
    name { Faker::Lorem.sentence }
    description { 'アプリです' }
    point { 'bootstrapで開発しました' }
    reference { 'https://find-apps.herokuapp.com/' }
    language { 'Ruby on Rails' }
    period   { "10" }
    association :user
    after(:build) do |app|
      app.image.attach(io: File.open('public/images/youtube.png'), filename: 'youtube.png')
    end
  end
end
