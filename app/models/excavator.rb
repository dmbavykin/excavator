# frozen_string_literal: true

class Excavator < ApplicationRecord
  belongs_to :ticket

  def full_address
    [address, city, state, zip].compact.join(', ')
  end
end
