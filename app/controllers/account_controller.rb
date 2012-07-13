
class AccountController < ApplicationController
  before_filter :authenticate_client_user!
  
  def index

  end
end
