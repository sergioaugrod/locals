module Session
  class CreateService
    def initialize(session, auth)
      @session = session
      @auth = auth
    end

    def call
      user = User::InitializeService.new(@auth).call
      assign_session(user.id)
    end

    private

    def assign_session(user_id)
      @session[:user_id] = user_id
      Session::VerifyAuthenticationService.new(@session).call
    end
  end
end
