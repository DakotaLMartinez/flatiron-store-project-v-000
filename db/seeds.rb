# connection = ActiveRecord::Base.connection

# connection.tables.each do |table_name|
#   table_symbol = table_name.to_sym
#   drop_table(table_symbol) if connection.table_exists? table_name
# end

# CreateCarts.new.change
# CreateItems.new.change
# CreateCategories.new.change
# CreateLineItems.new.change
# CreateOrders.new.change
# DeviseCreateUsers.new.change
# AddCategoryIdToItems.new.change
# AddStatusToCarts.new.change
# AddCurrentCartIdToUser.new.change

Item.all.each { |i| i.delete }
Cart.all.each { |i| i.delete }
Category.all.each { |i| i.delete }
LineItem.all.each { |i| i.delete }
# Order.all.each { |i| i.delete }
User.all.each { |i| i.delete }

10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = Category.first.id
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(email: 'my@email.com', password: 'mysecretpassword')