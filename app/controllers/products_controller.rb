class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_product, only: %i[show edit update destroy]


  def index
    if params[:sort_cat].present?
      if @products = Product.where(categories: params[:sort_cat]).empty?
        @products = Product.all
      else
        @products = Product.where(categories: params[:sort_cat])
      end
    elsif params[:query].present?
      @products = Product.name_or_description(params[:query])
    else
      @products = Product.all
    end
  end

  def show
  end

  def new
    @product = Product.new
    @product.user = current_user
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to products_path, notice: "project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :rating,:categories ,photos: [])
  end
end
