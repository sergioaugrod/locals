require 'rails_helper'

RSpec.describe Group::Image, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
end
