class CartsController < ApplicationController
  before_action :current_cart
  # :set_cart, only: %i[show]

  def show
    @cart = @current_cart
    authorize @cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to products_path
  end
  private

  # def set_cart
  #   @cart = Cart.find(params[:id])
  # end

end
