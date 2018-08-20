# frozen_string_literal: true

FactoryBot.define do
  factory :gift do
    name { 'MyString' }
    description { 'MyText' }
    event { nil }
  end
end
