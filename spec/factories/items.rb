FactoryBot.define do
  factory :item do
    name                  { 'test' }
    description           { 'testtest' }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_fee_id       { 2 }
    area_id               { 2 }
    day_id                { 2 }
    price                 { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
