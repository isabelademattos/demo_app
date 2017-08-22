FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}

    factory :user_local do
      sequence(:address)  { |n| "Person #{n}" }
      sequence(:user_id)
    end
  end

  factory :local do
    sequence(:address)  { |n| "Person #{n}" }
    sequence(:user_id)
  end
end
