class CardsController < ApplicationController

  def create
    if params['payjp-token'].blank?
      redirect_to add_card_user_path(current_user)
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_users_path
      else
        redirect_to add_card_user_path, id: current_user.id
      end
    end
  end


  def delete
    card = current_user.cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    else
      redirect_to card_users_path
    end
  end
end
