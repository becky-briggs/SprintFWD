# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:project) { create(:project) }

  # association tests
  describe 'associations:' do
    context 'with associated members' do
      let!(:project) { create(:project, :with_members) }

      it 'can have many members' do
        expect(project.members.count).to eq(2)
      end
    end

    context 'with no associated members' do
      it 'can have no members' do
        expect(project.members.count).to eq(0)
      end
    end
  end

  # validation tests
  describe 'validations:' do
    it 'is valid with valid attributes' do
      expect(project).to be_valid
    end

    it 'validates the presence of name' do
      project.name = nil

      expect(project).not_to be_valid
    end
  end
end
