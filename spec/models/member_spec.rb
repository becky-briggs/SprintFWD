# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:team) { create(:team) }
  let(:member) { create(:member, team:) }

  # association tests
  describe 'associations:' do
    it 'belongs to a team' do
      expect(member.team).to eql(team)
    end
  end

  # validation tests
  describe 'validations:' do
    it 'is valid with valid attributes' do
      expect(member).to be_valid
    end

    it 'validates the presence of first name' do
      member.first_name = nil

      expect(member).not_to be_valid
    end

    it 'validates the presence of last name' do
      member.last_name = nil

      expect(member).not_to be_valid
    end

    it 'validates the presence of team' do
      member.team = nil

      expect(member).not_to be_valid
    end
  end
end
