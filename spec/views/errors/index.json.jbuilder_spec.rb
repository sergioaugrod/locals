require 'rails_helper'

RSpec.describe 'errors/index' do
  it 'display all the errors' do
    assign(:exception, message: 'Sample Error')

    render

    expect(rendered).to match(/Sample Error/)
  end
end
