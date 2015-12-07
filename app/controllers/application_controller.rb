class ApplicationController < ActionController::Base
  respond_to :json

  rescue_from Exception do |exception|
    config = Errors::Mapping.config(exception.class)
    @exception = exception
    logger.error(@exception)
    render 'errors/index', status: config['status']
  end

  protected

  def verify_authentication
    @current_user = Session::VerifyAuthenticationService.new(session).call
  end
end
