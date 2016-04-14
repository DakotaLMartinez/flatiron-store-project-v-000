class AddStatusToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string, default: "current"
  end
end
