# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/members', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Member. As you add validations to Member, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { first_name: 'John',
      last_name: 'Smith',
      city: 'New York',
      state: 'New York',
      country: 'United States',
      team_id: team.id }
  end

  let(:invalid_attributes) do
    { first_name: 'John',
      last_name: 'Smith',
      city: 'New York',
      state: 'New York',
      country: 'United States',
      team_id: nil }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::MembersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  let(:team) { create(:team) }
  let!(:member) { create(:member, valid_attributes) }

  describe 'GET /index' do
    before do
      create_list(:member, 2)
    end

    context 'when accessed at the root level' do
      it 'renders a successful response' do
        get api_v1_members_url, headers: valid_headers, as: :json
        expect(response).to be_successful
      end

      it 'returns all records' do
        get api_v1_members_url, headers: valid_headers, as: :json
        results = JSON.parse(response.body)
        expect(results.count).to eq(Member.count)
      end
    end

    context 'when accessed nested under teams' do
      it 'renders a successful response' do
        get api_v1_team_members_url(team), headers: valid_headers, as: :json
        expect(response).to be_successful
      end

      it 'only returns records for given team' do
        get api_v1_team_members_url(team), headers: valid_headers, as: :json
        results = JSON.parse(response.body)
        expect(results.count).to eq(team.members.count)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_member_url(member), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Member' do
        expect do
          post api_v1_members_url,
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(Member, :count).by(1)
      end

      it 'renders a JSON response with the new member' do
        post api_v1_members_url,
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Member' do
        expect do
          post api_v1_members_url,
               params: invalid_attributes, as: :json
        end.to change(Member, :count).by(0)
      end

      it 'renders a JSON response with errors for the new member' do
        post api_v1_members_url,
             params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      new_first_name = 'Jane'
      let(:new_attributes) do
        { first_name: new_first_name }
      end

      it 'updates the requested member' do
        patch api_v1_member_url(member),
              params: new_attributes, headers: valid_headers, as: :json
        member.reload
        expect(member.first_name).to eql(new_first_name)
      end

      it 'renders a JSON response with the member' do
        patch api_v1_member_url(member),
              params: new_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the member' do
        patch api_v1_member_url(member),
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update_team' do
    context 'with valid parameters' do
      let(:new_team) { create(:team) }
      let(:new_attributes) do
        { team_id: new_team.id }
      end

      it 'updates the team of the requested member' do
        patch api_v1_member_url(member),
              params: new_attributes, headers: valid_headers, as: :json
        member.reload
        expect(member.team).to eql(new_team)
      end

      it 'renders a JSON response with the member' do
        patch api_v1_member_url(member),
              params: new_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the member' do
        patch api_v1_member_url(member),
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested member' do
      expect do
        delete api_v1_member_url(member), headers: valid_headers, as: :json
      end.to change(Member, :count).by(-1)
    end
  end
end
