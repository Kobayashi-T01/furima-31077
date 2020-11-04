FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'test123'}
    password_confirmation {password}
    first_name            {'田中'}
    family_name           {'太郎'}
    first_name_kana       {'タナカ'}
    family_name_kana      {'タロウ'}
    birth_day             {'2020-01-01'}
  end
end