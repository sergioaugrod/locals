require 'rails_helper'

RSpec.describe 'api/groups/index' do
  it 'displays all the groups' do
    assign(:groups, create_list(:group, 1))

    render

    expect(rendered).to match(/Test Group/)
    expect(rendered).to match(/-50.0/)
    expect(rendered).to match(/-45.03/)
    expect(rendered).to match(/true/)
  end
end
