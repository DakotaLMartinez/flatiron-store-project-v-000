class LineItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :initialize_cart, only: [:create]
  
  def create 
    item = Item.find_by(id: line_item_params)
    @new_item = @cart.add_item(item.id)
    @new_item.save
    @cart.save 
    current_user.save
    redirect_to cart_path(@cart)
  end
  
  private 
  
  def line_item_params
    params.require(:item_id)
  end
  
end
