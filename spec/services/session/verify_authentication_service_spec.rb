require 'rails_helper'

RSpec.describe Session::VerifyAuthenticationService do
  describe '#call' do
    subject { described_class.new(session).call }

    context 'when the user exists' do
      let(:user) { create(:user) }
      let(:session) { { user_id: user.id } }

      its(:provider) { is_expected.to eq 'facebook' }
      its(:uid) { is_expected.to eq '12345' }
      its(:name) { is_expected.to eq 'User Name' }
      its(:oauth_token) { is_expected.to eq '123456' }
    end

    context 'when the user not exists' do
      let(:session) { { user_id:  1_234_567 } }

      it 'should raise Exceptions::AuthenticationError' do
        expect { subject }.to raise_error(Exceptions::AuthenticationError)
      end
    end
  end
end
