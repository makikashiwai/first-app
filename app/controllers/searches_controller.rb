class SearchesController < ApplicationController

  def index
    #検索後の商品表示アクション
    @products = Product.on_sell.includes([:images]).order(created_at: :desc)
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").order("id DESC")
    if params[:keyword] == ""
      redirect_to '/products/search?utf8=✓&keyword=+++'
    end
    if @products.count == 0
      @all_products = Product.limit(25).order("id ASC")
    end
  end

  

end
