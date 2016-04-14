class LineItem < ActiveRecord::Base
  # t.integer "quantity", default: 1
  # t.integer "cart_id"
  # t.integer "item_id"
  
  belongs_to :cart
  belongs_to :item
  
  def item_price 
    item.price
  end
  
  def amount 
    quantity * item_price
  end
end
