require 'rails_helper'

RSpec.describe Group::CreateService do
  describe '#call' do
    subject { described_class.new(group).call }

    context 'when the group is correct' do
      let(:group) { build(:group).attributes }

      its(:name) { is_expected.to eq 'Test Group' }
      its(:latitude) { is_expected.to eq(-50.0) }
      its(:longitude) { is_expected.to eq(-45.03) }
      its(:active) { is_expected.to be true }
    end

    context 'when the group is incorrect' do
      let(:group) {}

      it 'should raise NoMethodError' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
