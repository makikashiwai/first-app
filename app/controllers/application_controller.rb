class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :authenticate_user!
  before_action :secret_key
  before_action :set_search
  before_action :set_parents

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

    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").order("id DESC")
    if params[:keyword] == ""
      redirect_to '/products/search?utf8=✓&keyword=+++'
    end
    if @products.count == 0
      @all_products = Product.limit(25).order("id ASC")
    end
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end

