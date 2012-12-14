class CartsController < ApplicationController
  before_filter :validate_cart, only: [:destroy]

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:store_index_count] = nil
    respond_to do |format|
      format.html { redirect_to store_index_path }
      format.json { head :no_content }
    end
  end

  private

  def validate_cart
    @cart = Cart.find_by_id(params[:id])
    if @cart.nil?
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "Invalid cart"
    end
  end
end
