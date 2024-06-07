class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current_cart

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def current_cart
    if current_user
      if current_user.carts.empty?
        new_cart = Cart.create(user_id: current_user.id)
        @current_cart = new_cart
      else
        @current_cart = current_user.carts.last
      end
      if @current_cart.order.present?
        new_cart = Cart.create(user_id: current_user.id)
        @current_cart = new_cart
      end
    end
  end
end
