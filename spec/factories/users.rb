FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {"タロウ"}
    first_name_kana{"タロウ"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
    #validatesを記述し、まずはfactoryBOTを完成
    #user_spec.rbを再度確認
  end
end
