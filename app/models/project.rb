# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :members

  validates :name, presence: true
end
