FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    school_id             { 2 }
    profile               { "こんにちは" }
    twitter               { "twitter" }
    qiita                 { "twitter" }
    after(:build) do |app|
      app.image.attach(io: File.open('public/images/youtube.png'), filename: 'youtube.png')
    end
  end
end
