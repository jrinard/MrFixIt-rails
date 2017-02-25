FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@epicodus.com" }
    password '123456'
  end
  factory :worker do
    sequence(:email){ "worker@epicodus.com" }
    password '123456'
  end
  factory :job do
    title "coder"
    description "lots of coding"
  end
end
