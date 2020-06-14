class CategoriesController < ApplicationController
  before_action :set_category, only: :show

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
    @category = Category.find(params[:id])
    @products = @category.products
    @products = @category.set_products
    @products = Product.where(category_id: [@category.id])
    # @products = @products.where(buyer_id: nil).order("created_at DESC").page(params[:page]).per(9)
  end

  def children_category
    @children = Category.find(params[:parentCategory]).children
  end

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
