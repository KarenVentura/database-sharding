# frozen_string_literal: true

# This CreateApplicants class create a table
class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :race
      t.string :gender
    end
  end
end
