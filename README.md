# SprintFWD

## Model Specs

- Member fields
    - first_name (required)
    - last_name (required)
    - city
    - state
    - country
- Team fields
    - name (required)
- Project fields
    - name (required)
- A member **must** belong to a team.
- A member can be **optionally** assigned to **multiple** projects.

## Exit Criteria

- API Endpoints to: Create/Update/Delete/Index/Show teams
- API Endpoints to: Create/Update/Delete/Index/Show members
- API Endpoints to: Create/Update/Delete/Index/Show projects
- API Endpoint to: Update the team of a member
- API Endpoint to: Get the members of a specific team
- API Endpoint to: Add a member to a project
- API Endpoint to: Get the members of a specific project


## Installation

1. Install Ruby 3.2.2.
2. Run `$ bundle install` to install dependencies.
3. Run `$ rails db:migrate` to run the migrations.
4. Run `$ rails server` to start the server.

## Usage
### API Documentation
- API Endpoints to: Create/Update/Delete/Index/Show teams
    - POST/PUT/DELETE/GET http://localhost:3000/api/v1/teams
- API Endpoints to: Create/Update/Delete/Index/Show members
    - POST/PUT/DELETE/GET http://localhost:3000/api/v1/members
- API Endpoints to: Create/Update/Delete/Index/Show projects
    - POST/PUT/DELETE/GET http://localhost:3000/api/v1/projects
- API Endpoint to: Update the team of a member
    - PATCH http://localhost:3000/api/v1/members/{member_id}/update_team
    - Body parameters: { team_id: integer }
- API Endpoint to: Get the members of a specific team
    - GET http://localhost:3000/api/v1/teams/{team_id}/members
- API Endpoint to: Add a member to a project
    - POST http://localhost:3000/api/v1/projects/{project_id}/add_member
    - Body parameters: { member_id: integer }
- API Endpoint to: Get the members of a specific project
    - GET http://localhost:3000/api/v1/projects/{project_id}/members

### Tests
Run `$ rspec` to run the tests.