class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname_kanji, :lastname_kanji, :firstname_katakana, :lastname_katakana, :birthday])
  end

end
