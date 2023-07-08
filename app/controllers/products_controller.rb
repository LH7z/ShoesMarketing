class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @user = current_user
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to profile_path, notice: "project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :rating, :image)
  end
end
