class HomeController < ApplicationController
  before_action :verify_authentication

  def index
  end
end
