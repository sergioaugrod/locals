require 'rails_helper'

RSpec.describe Api::GroupsController, type: :controller do
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
    context 'when authenticated' do
      let(:user) { build(:user) }
      let(:group) { build(:group) }
      let(:group_create_service) { double(Group::CreateService) }
      let(:group_params) do
        {
          name: 'Test Group',
          latitude: -50.00,
          longitude: -45.00,
          active: true
        }
      end

      before do
        expect(subject).to receive(:verify_authentication).and_return(user)
        expect(Group::CreateService).to receive(:new).and_return(group_create_service)
        expect(group_create_service).to receive(:call).and_return(group)

        post :create, group: group_params, format: :json
      end

      it { is_expected.to render_template('show') }
      it { is_expected.to respond_with(201) }
    end

    context 'when not authenticated' do
      before do
        post :create, format: :json
      end

      it { is_expected.to render_template('errors/index') }
      it { is_expected.to respond_with(401) }
    end
  end

  describe 'GET #near' do
    context 'when authenticated' do
      let(:user) { build(:user) }
      let(:near_group_params) do
        {
          latitude: -50.00,
          longitude: -45.00
        }
      end

      before do
        expect(subject).to receive(:verify_authentication).and_return(user)
        get :near, group: near_group_params, format: :json
      end

      it { is_expected.to render_template('near') }
      it { is_expected.to respond_with(200) }
    end

    context 'when not authenticated' do
      before do
        get :near, format: :json
      end

      it { is_expected.to render_template('errors/index') }
      it { is_expected.to respond_with(401) }
    end
  end
end
