# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { create(:team) }

  # validation tests
  describe 'validations:' do
    it 'is valid with valid attributes' do
      expect(team).to be_valid
    end

    it 'validates the presence of name' do
      team.name = nil

      expect(team).not_to be_valid
    end
  end
end
