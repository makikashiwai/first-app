class SearchesController < ApplicationController

  def index
    @products = Product.on_sell.includes([:images]).order(created_at: :desc)
  end

end
