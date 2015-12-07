require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it { is_expected.to use_before_action(:verify_authentication) }

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
end
