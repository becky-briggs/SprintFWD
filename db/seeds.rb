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

# Clearing the database
Member.destroy_all
Team.destroy_all
Project.destroy_all

# Seeding teams and associated members
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

# Seeding projects
10.times do
  @project = Project.create!(name: Faker::Commerce.product_name)
end

Rails.logger.info "Created #{Project.count} projects"

# Assign members to projects
def assign_members_to_project(project, members)
  project.members << members
  project.save

  Rails.logger.info "Assigned #{project.members.count} members to #{project.name} project"
end

assign_members_to_project(Project.first, Member.first(2))
assign_members_to_project(Project.second, Member.last(3))
assign_members_to_project(Project.third, Member.fourth)
