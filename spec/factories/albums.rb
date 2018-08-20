# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    sequence(:title) { |i| "Title #{i}" }
  end
end
