module Session
  class VerifyAuthenticationService
    def initialize(session)
      @session = session
    end

    def call
      verify
    end

    private

    def verify
      if @session[:user_id]
        User.find(@session[:user_id])
      else
        raise_authentication_error
      end
    rescue
      raise_authentication_error
    end

    def raise_authentication_error
      raise Exceptions::AuthenticationError, I18n.t('exceptions.authentication_error')
    end
  end
end
