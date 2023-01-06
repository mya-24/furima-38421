FactoryBot.define do
  factory :item do
    item_name         {Faker::Lorem.word}
    description       {Faker::Lorem.sentence}
    category_id       {Faker::Number.between(from: 1, to: 10)}
    condition_id      {Faker::Number.between(from: 1, to: 6)}
    costperson_id     {Faker::Number.between(from: 1, to: 2)}
    prefecture_id     {Faker::Number.between(from: 1, to: 47)}
    prepareday_id     {Faker::Number.between(from: 1, to: 3)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/test/sample.jpeg'), filename: 'sample.jpeg')
    end

  end
end
