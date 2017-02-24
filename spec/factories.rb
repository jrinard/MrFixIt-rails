FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password '123456'
  end
  factory :job do
    title "coder"
    description "lots of coding"
  end
end
