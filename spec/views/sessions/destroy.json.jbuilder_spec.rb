require 'rails_helper'

RSpec.describe 'sessions/destroy' do
  it 'display the farewell message' do
    render

    expect(rendered).to match(/Good Bye/)
  end
end
