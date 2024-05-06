# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :team

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team, presence: true
end
