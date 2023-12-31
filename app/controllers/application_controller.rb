class ApplicationController < ActionController::API
  include DeviseHackFakeSession
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :profile_image, :introduction])
  end
end
