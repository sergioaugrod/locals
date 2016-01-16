require 'rails_helper'

RSpec.describe Group::FinderService do
  describe '#call' do
    subject { described_class.new.call }

    context 'when there are groups created' do
      before do
        create(:group)
      end

      it 'returns all created groups' do
        expect(subject.count).to eq 1
      end
    end

    context 'when there arent groups created' do
      it 'returns no group' do
        expect(subject).to be_empty
      end
    end
  end
end
