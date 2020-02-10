# frozen_string_literal: true

module JsonHelper
  def build_request_body_for(api_version, endpoint, action)
    read_json('requests', api_version, endpoint, action)
  end

  def response_schema(api_version, endpoint, action)
    read_json('responses', api_version, endpoint, action)
  end

  private

  def read_json(kind, api_version, endpoint, action)
    JSON.parse(
      Rails.root.join('spec', 'fixtures', kind, 'api', api_version.to_s, endpoint.to_s, "#{action}.json").read
    )
  end
end
