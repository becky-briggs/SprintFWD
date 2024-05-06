# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  let!(:team) { create(:team) }

  # association tests
  describe 'associations:' do
    context 'with associated members' do
      let!(:member) { create(:member, team:) }

      it 'has many members' do
        expect(team.members).to include(member)
      end

      it 'does not delete team on destroy' do
        expect { team.destroy }.to change(described_class, :count).by(0)
      end
    end

    context 'with no associated members' do
      it 'does delete team on destroy' do
        expect { team.destroy }.to change(described_class, :count).by(-1)
      end
    end
  end

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
