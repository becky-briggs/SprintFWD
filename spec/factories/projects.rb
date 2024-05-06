# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Commerce.product_name }

    trait :with_members do
      after :create do |project|
        members = create_list(:member, 2)

        project.members << members
        project.save
      end
    end
  end
end
