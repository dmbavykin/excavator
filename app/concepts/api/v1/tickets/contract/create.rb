# frozen_string_literal: true

class Api::V1::Tickets::Contract::Create < ApplicationContract
  property :request_number
  property :sequence_number
  property :request_type
  property :response_due_date_time
  property :primary_sa_code
  property :additional_sa_codes
  property :well_known_text
  property :excavator, form: Api::V1::Excavators::Contract::Create, populate_if_empty: Excavator

  validation do
    configure do
      option :form

      def valid_enum?(value)
        ::Ticket.request_types.keys.include?(value)
      end
    end

    required(:request_number).filled(:str?)
    required(:sequence_number).filled(:int?)
    required(:request_type).filled(:str?, :valid_enum?)
    required(:response_due_date_time).filled(:time?)
    required(:primary_sa_code).filled(:str?)
    required(:additional_sa_codes).filled(:array?)
    required(:well_known_text).filled(:str?)
  end

  def deserialize!(params)
    params[:response_due_date_time] = params.dig(:date_times, :response_due_date_time)
    params[:primary_sa_code] = params.dig(:service_area, :primary_service_area_code, :sa_code)
    params[:additional_sa_codes] = params.dig(:service_area, :additional_service_area_codes, :sa_code)
    params[:well_known_text] = params.dig(:excavation_info, :digsite_info, :well_known_text)
    params
  end
end
