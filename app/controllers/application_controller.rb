# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age gender longitude latitude image])
  end


  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to users_path
  end

  def record_not_found
    flash[:alert] = 'Record does not exist'
    redirect_back(fallback_location: root_path)
  end

  def user_auth

  end
end
