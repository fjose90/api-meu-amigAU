FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    cpf_cnpj { Faker::Number.number(digits: 11) }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    person_type { %i[physical legal].sample }

    factory :invalid_person do
      name { nil }
    end
  end
end
