FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { 'みょうじ' }
    first_name            { 'なまえ' }
    last_name_kana        { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    birth_day             { '2021-07-01' }
  end
end
