class ApplicationController < ActionController::Base
  attr_accessor :current_ability, :current_branch, :current_client
  protect_from_forgery
  
  before_filter :authenticate_client_user!
  before_filter :set_current_branch
  before_filter :set_current_client


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
  private
  def current_ability
    @current_ability ||= Ability.new(current_client_user)
  end
  
  def set_current_branch
    if client_user_signed_in?
      @current_branch = current_client_user.branch 
    end
  end

  def set_current_client
    if client_user_signed_in?
      @current_client = current_client_user.client
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_client_user_session_path
  end
    
end
