FactoryBot.define do
  factory :form do
    postal_code         { '123-4567' }
    area_id             { 2 }
    city                { 'あああ' }
    house_number        { '1234-1' }
    building            { '' }
    number              { 1_111_111_111 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
