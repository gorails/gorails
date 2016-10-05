FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@test.com" }
end
