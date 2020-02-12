# frozen_string_literal: true

module ApplicationEndpoint
  private

  def default_cases
    {
      created: ->(result) { result.success? && success_with?(result, :created) },
      invalid: ->(result) { result.failure? && result['contract.default']&.errors.present? }
    }
  end

  def default_handler
    {
      created: ->(result, **) { success(result, :created) },
      invalid: ->(result, **) { render_errors(result, :unprocessable_entity) }
    }
  end

  def success_with?(result, status)
    result[:semantic_success] == status
  end

  def failed_with?(result, status)
    result[:semantic_failure] == status
  end

  def success(result, status)
    if result[:serialized_model]
      render json: result[:serialized_model]
    else
      head(status)
    end
  end

  def render_errors(result, status)
    render json: result['contract.default'].errors.messages, status: status
  end
end
