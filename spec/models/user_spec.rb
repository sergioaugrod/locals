require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:groups) }

  it { is_expected.to validate_presence_of(:provider) }
  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:oauth_token) }
  it { is_expected.to validate_presence_of(:oauth_expires_at) }
end
