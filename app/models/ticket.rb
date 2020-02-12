# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  enum request_type: {
    normal: 0
  }

  def coordinates
    well_known_text.match(/POLYGON\(\((.*)\)\)/)[1]
  end
end
