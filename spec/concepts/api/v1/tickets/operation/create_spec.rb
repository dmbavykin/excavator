# frozen_string_literal: true

RSpec.describe Api::V1::Tickets::Operation::Create do
  subject(:result) { described_class.call(params: params) }

  let(:params) do
    {
      request_number: FFaker::Product.model,
      sequence_number: rand(1000..3000),
      request_type: 'normal',
      date_times: {
        response_due_date_time: Time.zone.now.to_s
      },
      service_area: {
        primary_service_area_code: {
          sa_code: FFaker::AddressUK.postcode
        },
        additional_service_area_codes: {
          sa_code: Array.new(3) { FFaker::AddressUK.postcode }
        }
      },
      excavator: {
        company_name: FFaker::Company.name,
        address: FFaker::AddressUA.street_name,
        city: FFaker::AddressUA.city,
        state: FFaker::AddressUA.province,
        zip: FFaker::AddressUA.zip_code,
        crew_onsite: true
      },
      excavation_info: {
        digsite_info: {
          well_known_text: 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))'
        }
      }
    }
  end

  describe 'Success' do
    it 'updates user profile' do
      expect(result).to be_success
      expect(result['model']).to be_persisted
      expect(result['model'].excavator).to be_persisted
    end
  end

  describe 'Failure' do
    let(:params) { {} }

    it 'sets errors' do
      expect(result).to be_failure
      expect(result['model']).not_to be_persisted
      expect(result['contract.default'].errors).not_to be_empty
    end
  end
end
