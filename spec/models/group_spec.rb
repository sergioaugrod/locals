require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to belong_to(:creator) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:images) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_presence_of(:logo) }
end
