require 'rails_helper'

RSpec.describe Session::CreateService do
  describe '#call' do
    subject { described_class.new(session, auth).call }

    context 'when the auth exists' do
      let(:session) { Hash.new }
      let(:auth) { OmniAuth.config.mock_auth[:facebook] }

      before do
        OmniAuthHelper.valid_facebook_login_setup
      end

      its(:provider) { is_expected.to eq 'facebook' }
      its(:uid) { is_expected.to eq '12345' }
      its(:name) { is_expected.to eq 'User Name' }
      its(:oauth_token) { is_expected.to eq '123456' }
    end

    context 'when the auth not exists' do
      let(:session) { Hash.new }
      let(:auth) {}

      it 'should raise NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end
end
