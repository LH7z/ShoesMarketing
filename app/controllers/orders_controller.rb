class OrdersController < ApplicationController

  def index
    if current_user.role == "custumer"
      @orders = Order.where(user_id: current_user)
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.cart = @current_cart
  end

  def create
    @order = Order.new(order_params)
    @order.cart = @current_cart
    @order.user = current_user
    if @order.save
      redirect_to orders_path, notice: "project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
