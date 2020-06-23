class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:edit, :update, :show, :purchase, :pay, :done, :destroy]
  before_action :set_card, only: [:purchase, :pay]
  # before_action :set_parents, only: [:index]

  def index
    #トップページの商品表示
    @products = Product.on_sell.includes([:images]).order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])

    #詳細ページの商品カテゴリー表示
    category_id = @product.category_id
    @this_category = Category.find(category_id)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
    # @store = @product.store_id
    # @parents = Category.where(ancestry: nil)
    #  @prefecture = @user.address.prefecture
  end

  def new
    #商品出品
    @product = Product.new
    # @category_parent =  Category.where("ancestry is null")
    @product.images.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      # @category_parent =  Category.where("ancestry is null")
      # product = Product.new
      render :new
    end
  end

  #購入確認
  def purchase
    if @card.blank?
      redirect_to controller: "users", action: "add_card", id: current_user.id
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  #商品購入クレジットカード
  def pay
    Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    currency: 'jpy',
    )
    redirect_to action: 'done'
  end
  
  #商品購入完了ページの表示
  def done
    @product.update_attribute(:buyer, 1)
  end

  #詳細ページに商品を表示させる
  def set_product
    @product = Product.find(params[:id])
  end

  #詳細ページの購入ボタンからカードを登録するときの表示
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  #詳細ページの配送料の表示
  def shipping_cost
    case @product.shipping_cost
    when "listing_person"
      @shipping_cost = 1
    when "buyer_burden"
      @shipping_cost = 2
    end
  end
   
  #詳細ページの配送日の表示
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

  #商品出品 親カテゴリーが選択された後に動くアクション
  def category_children
    @category_children = Category.find("#{params[:parent_id]}").children
    #親カテゴリーに紐付く子カテゴリーを取得
  end

  #商品出品 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
    #子カテゴリーに紐付く孫カテゴリーの配列を取得
  end

  private

  #商品の情報を保存
  def product_params
    params.require(:product).permit(:name, :price, :introduction, :shipping_cost, :shipping_days, :category_id, :buyer, :store_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end


  #いらないかも
  # def set_parents
  #   @parents = Category.where(ancestry: nil)
  # end

  #いらないかも
  # def category_children
  #   @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  # end

  # def category_grandchildren
  #   @child_category = Category.find(params[:child_name])
  #   @category_grandchildren = @child_category.children
  # end

  #商品編集のアクション
  # def edit
  #   if @product.user != current_user
  #     redirect_to root_path
  #   else
  #     @product.images.new
  #   end
  # end

  #商品編集後のアクション
  # def update
  #   if @product.update(product_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  #カレントユーザーの商品の削除(管理者を作った時に使う)
  # def destroy
  #   if user_signed_in? && current_user.id == @item.user_id
  #     @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end
end
