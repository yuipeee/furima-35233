FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a12345'}
    password_confirmation {password}
    first_name            {'名前'}
    first_name_kana       {'ナマエ'}
    last_name             {'苗字'}
    last_name_kana        {'ミョウジ'}
    birthday              {'19950101'}
  end
end