require 'cpf_faker'

FactoryGirl.define do
  factory :user do
    nickname 'MyNickName'
    first_name 'MyFirstName'
    last_name 'MyLastName'
    email { generate(:email) }
    password 'password123'
    password_confirmation 'password123'
  end

  factory :user_with_cpf, parent: :user do    
    cpf { Faker::CPF.numeric }
  end

  factory :user_without_cpf, parent: :user do    
    cpf nil
  end

end
