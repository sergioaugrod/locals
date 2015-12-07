require 'rails_helper'

RSpec.describe Session::DestroyService do
  describe '.call' do
    subject { described_class.new(session).call }

    let(:session) { { user_id: 1_233_234 } }

    it 'returns empty session' do
      expect(subject).to be_empty
    end
  end
end
