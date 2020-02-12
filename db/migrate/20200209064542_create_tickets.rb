# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.integer :sequence_number
      t.integer :request_type, null: false, default: 0
      t.datetime :response_due_date_time
      t.string :primary_sa_code
      t.string :additional_sa_codes, array: true, default: []
      t.string :well_known_text

      t.timestamps
    end
  end
end
