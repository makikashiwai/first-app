class UsersController < ApplicationController

  def show
    # @user = User.find(params[:id])
  end
  
  def card
    @cards = current_user.cards
    if @cards.present?
      @card_information = []
      @cards.each_with_index do |card, i|
        customer = Payjp::Customer.retrieve(card.customer_id)
        @card_information[i] = customer.cards.retrieve(card.card_id)
      end
    end
  end

  def add_card
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "add_card", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "card"
      else
        redirect_to action: "add_card", id: current_user.id
      end
    end
  end

  def delivery_address
  end
  
  def user_information
    @user = User.find(current_user.id)
  end
  
end
