# frozen_string_literal: true

RSpec.describe Api::V1::Tickets::Contract::Create do
  subject(:form) { described_class.new(:: Ticket.new) }

  let(:valid_params) do
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
      excavation_info: {
        digsite_info: {
          well_known_text: 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))'
        }
      }
    }
  end

  it 'is valid' do
    expect(form.validate(valid_params)).to eq(true)
  end

  context 'when invalid' do
    context 'with request_number' do
      it_behaves_like 'validation that field filled', :request_number
      it_behaves_like 'validation that field is expected class', :request_number, :str
    end

    context 'with sequence_number' do
      it_behaves_like 'validation that field filled', :sequence_number
      it_behaves_like 'validation that field is expected class', :sequence_number, :int
    end

    context 'with request_type' do
      it_behaves_like 'validation that field filled', :request_type
      it_behaves_like 'validation that field is expected class', :request_type, :str

      context 'with validation for valid_enum? predicate' do
        let(:params) { valid_params.merge(request_type: 'test') }

        it 'is invalid' do
          expect(subject.validate(params)).to eq(false)
          expect(subject.errors.messages[:request_type]).to include I18n.t('errors.valid_enum?')
        end
      end
    end

    context 'with response_due_date_time' do
      it_behaves_like 'validation that field filled', :response_due_date_time
      it_behaves_like 'validation that field is expected class', :response_due_date_time, :time
    end

    context 'with primary_sa_code' do
      it_behaves_like 'validation that field filled', :primary_sa_code
      it_behaves_like 'validation that field is expected class', :primary_sa_code, :str
    end

    context 'with additional_sa_codes' do
      it_behaves_like 'validation that field filled', :additional_sa_codes
      it_behaves_like 'validation that field is expected class', :additional_sa_codes, :array
    end

    context 'with well_known_text' do
      it_behaves_like 'validation that field filled', :well_known_text
      it_behaves_like 'validation that field is expected class', :well_known_text, :str
    end
  end
end
