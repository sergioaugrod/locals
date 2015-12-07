require 'rails_helper'

RSpec.describe 'sessions/create' do
  it 'display the current user' do
    assign(:current_user, build(:user))

    render

    expect(rendered).to match(/facebook/)
    expect(rendered).to match(/User Name/)
  end
end
