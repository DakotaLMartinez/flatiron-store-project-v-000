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
  
  def title 
    item.title
  end
  
  def inventory 
    item.inventory
  end
  
  def check_inventory 
    item.inventory > quantity
  end
end
