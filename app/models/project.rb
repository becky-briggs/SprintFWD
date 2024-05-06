# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :members, before_add: :validates_member

  validates :name, presence: true

  def validates_member(member)
    raise ActiveRecord::Rollback if members.include? member
  end
end
