# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { Faker::Company.department }
  end
end
