class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_client_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_client_user_session_path
  end
    
end
