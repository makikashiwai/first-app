class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :authenticate_user!
  before_action :secret_key
  before_action :set_search

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :lastname_kana, :firstname_kana, :birth_day])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def secret_key
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
  end

  def production?
    Rails.env.production?
  end

  def set_search
    @search = Product.ransack(params[:q])
    @search_products = @search.result
  end

end
