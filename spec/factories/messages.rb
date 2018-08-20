# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    name { 'Foo' }
    email { 'foo@bar.com' }
    content { 'Foo Bar' }
  end
end
