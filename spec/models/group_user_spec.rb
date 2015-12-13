require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
end
