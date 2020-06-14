class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  #トップページの子と孫を表示させる
  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def index
  end

  def show
    @products = @category.set_products
    @products = Product.on_sell.includes([:images]).order(created_at: :desc)
    # @products = @products.where(buyer_id: nil).order("created_at DESC").page(params[:page]).per(9)
    @category = Category.find(params[:id])
    
    #カテゴリーの写真が全て紐づく原因
    # @products = @category.products
    # @products = Product.where(category_id: [@category.id])
  end

  #トップページの子を表示させる
  def children_category
    @children = Category.find(params[:parentCategory]).children
  end

  #トップページの孫を表示させる
  def grandchildren_category
    @grandchildren = Category.find(params[:childCategory]).children
  end

  private
  def set_category
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    else
      @category_links = @category.siblings
    end
  end

end
