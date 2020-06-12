class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :set_product, only: [:edit, :update, :show, :purchase, :pay, :done, :destroy]
  before_action :set_card, only: [:purchase, :pay]

  def index
    @products = Product.on_sell.includes([:images]).order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    category_id = @product.category_id
    @this_category = Category.find(category_id)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
    @store = @product.store_id
    # @prefecture = @user.address.prefecture
  end

  def new
    @product = Product.new
    @parents = Category.where(ancestry: nil).pluck(:name).unshift("---")
    @product.images.new
    # @product.build_brand
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @parents = Category.where(ancestry: nil).pluck(:name).unshift("---")
      @product.images.new
      render :new
    end
  end

  def edit
    if @product.user != current_user
      redirect_to root_path
    else
      @product.images.new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def product_purchase
  end

  def purchase
    if @card.blank?
      redirect_to controller: "users", action: "add_card", id: current_user.id
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    currency: 'jpy',
    )
    redirect_to action: 'done'
  end

  def done
    @product.update_attribute(:buyer, 1)
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @child_category = Category.find(params[:child_name])
    @category_grandchildren = @child_category.children
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :introduction, :shipping_cost, :shipping_days, :prefecture_id, :category_id, :buyer, :store_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  # def size
  #   case @item.size
  #   when "S"
  #     @size = 1
  #   when "M"
  #     @size = 2
  #   when "L"
  #     @size = 3
  #   when "LL"
  #     @size = 4
  #   end
  # end

  # def status
  #   case @item.status
  #   when "brand_new"
  #     @status = 1
  #   when "near_to_unused"
  #     @status = 2
  #   when "no_scrach"
  #     @status = 3
  #   when "slight_scrach"
  #     @status = 4
  #   when "has_scrach"
  #     @status = 5
  #   when "bad_state"
  #     @status = 6
  #   end
  # end

  def shipping_cost
    case @product.shipping_cost
    when "listing_person"
      @shipping_cost = 1
    when "buyer_burden"
      @shipping_cost = 2
    end
  end

  def shipping_days
    case @product.shipping_days
    when "early_ship"
      @shipping_days = 1
    when "mid_ship"
      @shipping_days = 2
    when "late_ship"
      @shipping_days = 3
    end
  end
end
