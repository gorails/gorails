# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    album { nil }
    asset { 'MyString' }
    title { 'MyString' }
  end
end
