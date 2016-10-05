FactoryGirl.define do
  factory :registration do
    event
    association :user, factory: :user_with_cpf
  end
end
