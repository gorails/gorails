require 'cpf_faker'

FactoryGirl.define do
  factory :user do
    nickname 'MyNickName'
    first_name 'MyFirstName'
    last_name 'MyLastName'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :user_with_cpf, parent: :user do
    email { generate(:email) }
    cpf { Faker::CPF.numeric }
  end

  factory :user_without_cpf, parent: :user do
    email { generate(:email) }
    cpf nil
  end

end
