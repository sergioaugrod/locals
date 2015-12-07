require 'rails_helper'

RSpec.describe 'home/index' do
  it 'display the home' do
    render

    expect(rendered).to match(/1/)
    expect(rendered).to match(/api/)
  end
end
