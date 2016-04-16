module CartsHelper
  
  def current_cart 
    current_user.current_cart
  end
  
  def add_to_cart(item)
    button_to 'Add to Cart', line_items_path(item_id: item.id) if user_signed_in?
  end
  
  def checkout
    button_to 'Checkout', checkout_path if current_cart
  end
  
  def order_total(cart)
    safe_join(["Order total: ", content_tag("strong", number_to_currency(cart.total) )])
  end
end
