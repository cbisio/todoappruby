FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by {Faker::Lorem.word}
  end
end
