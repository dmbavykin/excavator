# frozen_string_literal: true

RSpec.describe Ticket do
  describe 'relations' do
    it { is_expected.to have_one :excavator }
  end
end
