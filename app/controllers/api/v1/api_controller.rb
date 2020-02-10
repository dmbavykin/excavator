# frozen_string_literal: true

class Api::V1::ApiController < ActionController::API
  include SimpleEndpoint::Controller
  include ApplicationEndpoint
end
