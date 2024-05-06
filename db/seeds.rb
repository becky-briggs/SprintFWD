# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seeding teams and associated members
Member.destroy_all
Team.destroy_all

10.times do
  @team = Team.create!(name: Faker::Company.department)

  2.times do
    Member.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      team: @team
    )
  end
end

Rails.logger.info "Created #{Team.count} teams"
Rails.logger.info "Created #{Member.count} members"
