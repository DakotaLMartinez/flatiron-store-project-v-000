module ItemsHelper
  def item_price(item)
    number_to_currency(item.price)
  end
  
  def in_your_cart(item)
    if user_signed_in?
      content_tag(:p) do 
        "You have #{current_user.in_your_cart(item)} in your cart"
        
      end
    end
  end
  
end
