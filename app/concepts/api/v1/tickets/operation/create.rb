# frozen_string_literal: true

class Api::V1::Tickets::Operation::Create < ApplicationOperation
  step Model(Ticket, :new)
  step Contract::Build(constant: Api::V1::Tickets::Contract::Create)
  step Contract::Validate()
  fail ::Macro::Semantic(failure: :unprocessable_entity)
  step Contract::Persist()
  step ::Macro::Semantic(success: :created)
end
