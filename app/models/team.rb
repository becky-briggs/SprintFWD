# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :members, dependent: :restrict_with_error

  validates :name, presence: true
end
