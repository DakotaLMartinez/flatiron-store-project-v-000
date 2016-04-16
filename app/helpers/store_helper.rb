module StoreHelper
  def category_list(categories)
    list = categories.collect do |category| 
      link_to category.title, category_path(category)
    end
    safe_join(list, " | ")
  end
  
end
