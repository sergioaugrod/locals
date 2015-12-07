require 'rails_helper'

RSpec.describe Group::FinderNearService do
  describe '.call' do
    subject { described_class.new(group).call }

    context 'when there are attributes' do
      context 'when have groups near ' do
        let(:group) { create(:group) }

        it 'returns one near groups' do
          expect(subject.count).to eq 1
        end
      end

      context 'when havent groups near' do
        let(:group) { build(:group) }
        let(:far_group) { create(:group, latitude: -50.00, longitude: -46.72) }

        it 'returns no groups' do
          expect(subject).to be_empty
        end
      end
    end

    context 'when there arent attributes' do
      let(:group) {}

      it 'should raise NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end
end
