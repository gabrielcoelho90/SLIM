FactoryBot.define do
  factory :user do
    name { "gabriel" }
    email {Faker::Internet.email}
    password {123456}
    gender {"male"}
    age {33}
    weight { 120 }
    height { 1.85 }
    timeline {21}
    kilos_to_lose {3}
  end
end
