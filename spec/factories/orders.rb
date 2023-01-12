FactoryBot.define do
  factory :order do
    
    address_postcode  {'123-4567'}
    prefecture_id     {Faker::Number.between(from: 1, to: 47)}
    address_cho       {'XX市XX町'}
    address_other     {'XXX xx番地'}
    address_building  {'XXXXビル 3F 101'}
    tel_number        {'0123000000'}
    token             {'tok_abcdefghijk00000000000000000'}

    association :user
    association :item

  end
end
