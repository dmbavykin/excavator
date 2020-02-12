# frozen_string_literal: true

RSpec.describe Excavator do
  describe 'relations' do
    it { is_expected.to belong_to :ticket }
  end
end
