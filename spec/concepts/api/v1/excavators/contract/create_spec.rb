# frozen_string_literal: true

RSpec.describe Api::V1::Excavators::Contract::Create do
  subject(:form) { described_class.new(::Excavator.new) }

  let(:valid_params) do
    {
      company_name: FFaker::Company.name,
      address: FFaker::AddressUA.street_name,
      city: FFaker::AddressUA.city,
      state: FFaker::AddressUA.province,
      zip: FFaker::AddressUA.zip_code,
      crew_onsite: true
    }
  end

  it 'is valid' do
    expect(form.validate(valid_params)).to eq(true)
  end

  context 'when invalid' do
    context 'with company_name' do
      it_behaves_like 'validation that field filled', :company_name
      it_behaves_like 'validation that field is expected class', :company_name, :str
    end

    context 'with address' do
      it_behaves_like 'validation that field filled', :address
      it_behaves_like 'validation that field is expected class', :address, :str
    end

    context 'with city' do
      it_behaves_like 'validation that field filled', :city
      it_behaves_like 'validation that field is expected class', :city, :str
    end

    context 'with state' do
      it_behaves_like 'validation that field filled', :state
      it_behaves_like 'validation that field is expected class', :state, :str
    end

    context 'with zip' do
      it_behaves_like 'validation that field filled', :zip
      it_behaves_like 'validation that field is expected class', :zip, :str
    end

    context 'with crew_on_site' do
      it_behaves_like 'validation that field filled', :crew_on_site
      it_behaves_like 'validation that field is expected class', :crew_on_site, :bool
    end
  end
end
