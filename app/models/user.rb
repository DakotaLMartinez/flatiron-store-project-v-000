class User < ActiveRecord::Base
  # t.string   "email",                  default: "", null: false
  # t.string   "encrypted_password",     default: "", null: false
  # t.string   "reset_password_token"
  # t.datetime "reset_password_sent_at"
  # t.datetime "remember_created_at"
  # t.integer  "sign_in_count",          default: 0,  null: false
  # t.datetime "current_sign_in_at"
  # t.datetime "last_sign_in_at"
  # t.string   "current_sign_in_ip"
  # t.string   "last_sign_in_ip"
  # t.datetime "created_at",                          null: false
  # t.datetime "updated_at",                          null: false
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :carts
  belongs_to :current_cart, class_name: "Cart"
  
  def in_your_cart(item)
    line_item = current_cart.line_items.find_by(item_id: item.id) if current_cart
    if line_item 
      line_item.quantity
    else
      0
    end
  end
  
end
