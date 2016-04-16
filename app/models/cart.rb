class Cart < ActiveRecord::Base
  # t.integer "user_id"
  # t.string  "status",  default: "current"
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  
  def total 
    line_items.collect do |line_item|
      line_item.amount
    end.inject(0, :+)
  end
  
  def add_item(item_id)
    line_item = line_items.find_by(item_id: item_id)
    if line_item 
      line_item.quantity += 1
      line_item
    else 
      line_items.build(quantity: 1, item_id: item_id)
    end
  end
  
  def checkout
    if check_inventory
      update_inventory
      self.status = "submitted"
      user.current_cart = nil 
      user.save
      self
    else
      false
    end
  end
  
  def check_inventory
    line_items.all? do |line_item|
      line_item.check_inventory
    end
  end
  
  def update_inventory 
    line_items.each do |line_item| 
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end
  
end
