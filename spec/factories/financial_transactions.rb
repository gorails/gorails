# frozen_string_literal: true

FactoryBot.define do
  factory :financial_transaction do
    object { 'MyString' }
    origin { 'MyString' }
    transaction_type { 'MyString' }
    value { 'MyString' }
    payment_date { 'MyString' }
    payment_method { 'MyString' }
    consolidated { false }
    consolidation_date { 'MyString' }
    association :user, factory: :user_without_cpf
  end
end
