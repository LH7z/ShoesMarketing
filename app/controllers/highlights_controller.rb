class HighlightsController < ApplicationController
  before_action :set_highlight, only: %i[destroy show]

  def show
  end

  def new
    @highlight = Highlight.new
  end

  def create
    @highlight = Highlight.new(high_params)

    if @highlight.save
      redirect_to products_path, notice: "highlight was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_highlight
    @highlight = Highlight.find(params[:id])
  end

  def high_params
    params.require(:highlight).permit(:name, :description, :photo)
  end

end
