# frozen_string_literal: true

RSpec.shared_examples 'validation that field filled' do |field|
  context "when #{field} is not filled" do
    let(:params) { valid_params.merge(field => nil) }

    it 'is invalid' do
      allow(subject).to receive(:deserialize!) { params }
      expect(subject.validate(params)).to eq(false)
      expect(subject.errors.messages[field]).to include I18n.t('errors.filled?')
    end
  end
end
