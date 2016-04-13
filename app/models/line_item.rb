class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  
  def unit_price 
    self.item.price
  end
  
  def amount 
    quantity * unit_price
  end
end
