FactoryBot.define do
  factory :user do
    nickname            {Faker::Name.name}
    email               {Faker::Internet.free_email}
    password            {'test1234'}
    password_confirmation {password}
    firstname_kanji     {'田中'}
    lastname_kanji      {'花子'}
    firstname_katakana  {'タナカ'}
    lastname_katakana   {'ハナコ'}
    birthday            {Faker::Date.birthday(min_age: 18, max_age: 70)}
  end
end
