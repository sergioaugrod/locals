require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #index' do
    context 'when authenticated' do
      let(:user) { build(:user) }

      before do
        expect(subject).to receive(:verify_authentication).and_return(user)
        get :index, format: :json
      end

      it { is_expected.to render_template('index') }
      it { is_expected.to respond_with(200) }
    end

    context 'when not authenticated' do
      before do
        get :index, format: :json
      end

      it { is_expected.to render_template('errors/index') }
      it { is_expected.to respond_with(401) }
    end
  end

  describe 'POST #create' do
    context 'when omniauth is set' do
      let(:user) { build(:user) }
      let(:session_create_service) { double(Session::CreateService) }

      before do
        OmniAuthHelper.valid_facebook_login_setup
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]

        expect(Session::CreateService).to receive(:new).with(session, OmniAuth.config.mock_auth[:facebook]).and_return(session_create_service)
        expect(session_create_service).to receive(:call).and_return(user)

        post :create, format: :json
      end

      it { is_expected.to render_template('create') }
      it { is_expected.to respond_with(200) }
    end

    context 'when omniauth isnt set' do
      before do
        post :create, format: :json
      end

      it { is_expected.to render_template('errors/index') }
      it { is_expected.to respond_with(400) }
    end
  end

  describe 'DELETE #destroy' do
    context 'when authenticated' do
      let(:user) { build(:user) }

      before do
        expect(subject).to receive(:verify_authentication).and_return(user)
        delete :destroy, format: :json
      end

      it { is_expected.to render_template('destroy') }
      it { is_expected.to respond_with(200) }
    end

    context 'when not authenticated' do
      before do
        delete :destroy, format: :json
      end

      it { is_expected.to render_template('errors/index') }
      it { is_expected.to respond_with(401) }
    end
  end
end
