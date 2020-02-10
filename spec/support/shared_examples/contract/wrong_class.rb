# frozen_string_literal: true

RSpec.shared_examples 'validation that field is expected class' do |field, predicate|
  context "when #{field} is not expected class" do
    let(:wrong_class_mapping) { Hash.new(1).merge(int: 'test', bool: 'test') }
    let(:params) { valid_params.merge(field => wrong_class_mapping[predicate]) }

    it 'is invalid' do
      allow(subject).to receive(:deserialize!) { params }
      expect(subject.validate(params)).to eq(false)
      expect(subject.errors.messages[field]).to include I18n.t("errors.#{predicate}?")
    end
  end
end
