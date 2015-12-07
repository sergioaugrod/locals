class SessionsController < ApplicationController
  before_action :verify_authentication, except: [:create]

  def index
  end

  def create
    @current_user = Session::CreateService.new(session, request.env['omniauth.auth']).call
  end

  def destroy
    Session::DestroyService.new(session).call
  end
end
