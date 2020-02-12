# frozen_string_literal: true

class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :crew_on_site, null: false, default: false
      t.references :ticket

      t.timestamps
    end
  end
end
