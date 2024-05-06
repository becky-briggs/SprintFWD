# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    team

    trait :with_projects do
      after :create do |member|
        projects = create_list(:project, 2)

        member.projects << projects
        member.save
      end
    end
  end
end
