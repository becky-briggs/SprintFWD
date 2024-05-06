# frozen_string_literal: true

class CreateJoinTableMemberProject < ActiveRecord::Migration[7.1]
  def change
    create_join_table :members, :projects do |t|
      t.index %i[member_id project_id]
      t.index %i[project_id member_id]
    end
  end
end
