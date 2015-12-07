class User
  class InitializeService
    def initialize(auth)
      @auth = auth
    end

    def call
      initialize_user
    end

    private

    def find_user
      User.where(provider: @auth.provider, uid: @auth.uid)
    end

    def initialize_user
      find_user.first_or_initialize.tap do |user|
        user.provider = @auth.provider
        user.uid = @auth.uid
        user.name = @auth.info.name
        user.oauth_token = @auth.credentials.token
        user.oauth_expires_at = Time.zone.at(@auth.credentials.expires_at)
        user.save!
      end
    end
  end
end
