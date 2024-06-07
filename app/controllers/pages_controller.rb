class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def shopcart
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end
end
