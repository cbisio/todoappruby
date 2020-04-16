FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by {Faker::Lorem.word}
    user_id {1}
    #association :user
  end
end
