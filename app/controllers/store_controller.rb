class StoreController < ApplicationController
  def index
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @products = Product.order(:title)
    @cart = current_cart
  end
end
