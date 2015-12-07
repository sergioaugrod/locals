module OmniAuthHelper
  def self.valid_facebook_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: 'facebook',
        uid: '12345',
        info: {
          first_name: 'User',
          last_name:  'Name',
          email:      'test12345@test54321.com'
        },
        credentials: {
          token: '123456',
          expires_at: Time.zone.now + 1.week
        },
        extra: {
          raw_info: {
            gender: 'male'
          }
        }
      })
    end
  end
end
