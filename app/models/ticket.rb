# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator

  enum request_type: {
    normal: 0
  }
end
