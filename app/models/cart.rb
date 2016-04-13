class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  
  def total 
    line_items.collect do |line_item|
      line_item.amount
    end.inject(0, :+)
  end
  
  def add_item(item_id)
    line_item = line_items.find_by(id: item_id)
    if line_item 
      line_item.quantity += 1
      line_item
    else 
      line_items.build(quantity: 1, item_id: item_id)
    end
  end
end
