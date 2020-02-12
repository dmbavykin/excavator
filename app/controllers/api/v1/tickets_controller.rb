# frozen_string_literal: true

class Api::V1::TicketsController < Api::V1::ApiController
  def create
    endpoint operation: Api::V1::Tickets::Operation::Create
  end
end
