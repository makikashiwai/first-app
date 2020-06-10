class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @products = Product.on_sell.includes([:images]).order(created_at: :desc)
  end
end
