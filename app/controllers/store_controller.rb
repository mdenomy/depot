class StoreController < ApplicationController
  attr_reader :store_access_count

  def index
    increment_index_count
    @products = Product.order(:title)
    @cart = current_cart
  end

  private

  def increment_index_count
    if session[:store_index_count].nil?
      session[:store_index_count] = 0
    end
    session[:store_index_count] += 1
    @store_access_count = session[:store_index_count]
  end
end
