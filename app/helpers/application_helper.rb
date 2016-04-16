module ApplicationHelper
  def nav_cart
    if current_cart
      content_tag(:li) do 
        link_to "Cart", cart_path(current_cart) 
      end  
    end
    
  end
  
  def nav_session_links
    if user_signed_in?
      safe_join([
        content_tag(:li, link_to("Signed in as #{current_user.email}", '#'), class: "right"),
        content_tag(:li, link_to("Sign out", destroy_user_session_path, method: :delete), class: "right")
      ])
    else
      safe_join([
        content_tag(:li, link_to("sign in", new_user_session_path), class: "right"),
        content_tag(:li, link_to("Sign up", new_user_registration_path), class: "right")
      ])
    end
  end
end
