FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    description {Faker::Lorem.word}
    done { true }
    todo_id { nil }
  end
end
