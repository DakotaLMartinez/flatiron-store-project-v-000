class CartsController < ApplicationController
  def show 
    @cart = Cart.find_by(id: params[:id])
    if @cart.nil?
      flash[:notice] = "Something wen't wrong."
      redirect_to root_path
    end
  end
  
  def checkout 
    @check_cart = current_cart.checkout
    if @check_cart 
      redirect_to cart_path(@check_cart)
    else 
      flash[:notice] = "Not enough inventory"
      @cart = Cart.find(params[:id])
      render :show
    end
  end
  
end
