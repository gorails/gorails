# frozen_string_literal: true

FactoryBot.define do
  factory :attachment do
    name { "Filename" }
    situation { true }
    file { File.open(File.join(Rails.root, '/spec/fixtures/files/image.png')) }
  end
end
