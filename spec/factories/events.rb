FactoryBot.define do # frozen_string_literal: true.
  factory :event do
    name 'MyEvent'
    description 'MyDescription'
    start_at '2016-01-01'
    end_at '2016-01-01'
    local 'MyLocal'
    participants_limit 10
    provides_certificate false
  end
end
