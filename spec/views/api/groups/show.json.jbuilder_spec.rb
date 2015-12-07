require 'rails_helper'

RSpec.describe 'api/groups/show' do
  it 'display the group' do
    assign(:group, build(:group))

    render

    expect(rendered).to match(/Test Group/)
    expect(rendered).to match(/-50.0/)
    expect(rendered).to match(/-45.03/)
  end
end
