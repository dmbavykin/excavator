# frozen_string_literal: true

RSpec.describe 'Api::V1::Tickets' do
  describe 'POST #create' do
    before { post '/api/v1/tickets', params: params }

    let(:params) { {} }

    context 'Unprocessable entity' do
      it 'description' do
        expect(status).to eq 422
        expect(body).to eq response_schema(:v1, :tickets, :create_error).to_json
      end
    end

    context 'Created' do
      let(:params) { build_request_body_for(:v1, :tickets, :create) }

      it 'description' do
        expect(status).to eq 201
      end
    end
  end
end
