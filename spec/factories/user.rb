FactoryGirl.define do
  factory :user do
    provider 'facebook'
    uid '12345'
    name 'User Name'
    oauth_token '123456'
    oauth_expires_at Time.zone.now + 1.week
  end
end
