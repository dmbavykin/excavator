# frozen_string_literal: true

class Api::V1::Excavators::Contract::Create < ApplicationContract
  property :company_name
  property :address
  property :city
  property :state
  property :zip
  property :crew_on_site

  validation do
    required(:company_name).filled(:str?)
    required(:address).filled(:str?)
    required(:city).filled(:str?)
    required(:state).filled(:str?)
    required(:zip).filled(:str?)
    required(:crew_on_site).filled(:bool?)
  end
end
